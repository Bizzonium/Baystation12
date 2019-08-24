/*
	File: Parser
*/
/*
	Class: n_Parser
	An object that reads tokens and produces an AST (abstract syntax tree).
*/
/n_Parser
/*
	Var: index
	The parser's current position in the token's list.
*/
	var/index = 1
/*
	Var: tokens
	A list of tokens in the source code generated by a scanner.
*/
	var/list/tokens   = new
/*
	Var: errors
	A list of fatal errors found by the parser. If there are any items in this list, then it is not safe to run the returned AST.

	See Also:
	- <scriptError>
*/
	var/list/errors   = new
/*
	Var: warnings
	A list of non-fatal problems in the script.
*/
	var/list/warnings = new
/*
	Var: curToken
	The token at <index> in <tokens>.
*/
	var/token/curToken
	var/stack/blocks=new
	var/node/BlockDefinition/GlobalBlock/global_block=new
	var/node/BlockDefinition/curBlock
/*
	Proc: Parse
	Reads the tokens and returns the AST's <GlobalBlock> node. Be sure to populate the tokens list before calling this procedure.
*/
/n_Parser/proc/Parse()

/*
	Proc: NextToken
	Sets <curToken> to the next token in the <tokens> list, or null if there are no more tokens.
*/
/n_Parser/proc/NextToken()
	if(index>=tokens.len)
		curToken=null
	else
		curToken=tokens[++index]
	return curToken

/*
	Class: nS_Parser
	An implmentation of a parser for n_Script.
*/
/n_Parser/nS_Parser
	var/n_scriptOptions/nS_Options/options
/*
	Constructor: New

	Parameters:
	tokens  - A list of tokens to parse.
	options - An object used for configuration.
*/
/n_Parser/nS_Parser/New(tokens[], n_scriptOptions/options)
		src.tokens=tokens
		src.options=options
		curBlock=global_block
		return ..()
/n_Parser/nS_Parser/Parse()
	ASSERT(tokens)
	for(,src.index<=src.tokens.len, src.index++)
		curToken=tokens[index]
		switch(curToken.type)
			if(/token/keyword)
				var/n_Keyword/kw=options.keywords[curToken.value]
				kw=new kw()
				if(kw)
					if(!kw.Parse(src))
						return
			if(/token/word)
				var/token/ntok
				if(index+1>tokens.len)
					errors+=new/scriptError/BadToken(curToken)
					continue
				ntok=tokens[index+1]
				if(!istype(ntok, /token/symbol))
					errors+=new/scriptError/BadToken(ntok)
					continue
				if(ntok.value=="(")
					ParseFunctionStatement()
				else if(options.assign_operators.Find(ntok.value))
					ParseAssignment()
				else
					errors+=new/scriptError/BadToken(ntok)
					continue
				if(!istype(curToken, /token/end))
					errors+=new/scriptError/ExpectedToken(";", curToken)
					continue
			if(/token/symbol)
				if(curToken.value=="}")
					if(!EndBlock())
						errors+=new/scriptError/BadToken(curToken)
						continue
				else
					errors+=new/scriptError/BadToken(curToken)
					continue
			if(/token/end)
				warnings+=new/scriptError/BadToken(curToken)
				continue
			else
				errors+=new/scriptError/BadToken(curToken)
				return
	return global_block

/n_Parser/nS_Parser/proc/CheckToken(val, type, err=1, skip=1)
	if(curToken.value!=val || !istype(curToken,type))
		if(err)
			errors+=new/scriptError/ExpectedToken(val, curToken)
		return 0
	if(skip)NextToken()
	return 1

/n_Parser/nS_Parser/proc/AddBlock(node/BlockDefinition/B)
	blocks.Push(curBlock)
	curBlock=B

/n_Parser/nS_Parser/proc/EndBlock()
	if(curBlock==global_block) return 0
	curBlock=blocks.Pop()
	return 1

/n_Parser/nS_Parser/proc/ParseAssignment()
	var/name=curToken.value
	if(!options.IsValidID(name))
		errors+=new/scriptError/InvalidID(curToken)
		return
	NextToken()
	var/t=options.binary_operators[options.assign_operators[curToken.value]]
	var/node/statement/VariableAssignment/stmt=new()
	stmt.var_name=new(name)
	NextToken()
	if(t)
		stmt.value=new t()
		stmt.value:exp=new/node/expression/value/variable(stmt.var_name)
		stmt.value:exp2=ParseExpression()
	else
		stmt.value=ParseExpression()
	curBlock.statements+=stmt

/n_Parser/nS_Parser/proc/ParseFunctionStatement()
	if(!istype(curToken, /token/word))
		errors+=new/scriptError("Bad identifier in function call.")
		return
	var/node/statement/FunctionCall/stmt=new
	stmt.func_name=curToken.value
	NextToken() //skip function name
	if(!CheckToken("(", /token/symbol)) //Check for and skip open parenthesis
		return
	var/loops = 0
	for()
		loops++
		if(loops >= 6000)
			CRASH("Something TERRIBLE has gone wrong in ParseFunctionStatement ;__;")

		if(!curToken)
			errors+=new/scriptError/EndOfFile()
			return
		if(istype(curToken, /token/symbol) && curToken.value==")")
			curBlock.statements+=stmt
			NextToken() //Skip close parenthesis
			return
		var/node/expression/P=ParseParamExpression()
		stmt.parameters+=P
		if(istype(curToken, /token/symbol) && curToken.value==",") NextToken()