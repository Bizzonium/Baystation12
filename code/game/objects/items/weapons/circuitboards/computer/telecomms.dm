#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/weapon/stock_parts/circuitboard/comm_monitor
	name = T_BOARD("telecommunications monitor console")
	build_path = /obj/machinery/computer/telecomms/monitor
	origin_tech = list(TECH_DATA = 3)

/obj/item/weapon/stock_parts/circuitboard/comm_server
	name = T_BOARD("telecommunications server monitor console")
	build_path = /obj/machinery/computer/telecomms/server
	origin_tech = list(TECH_DATA = 3)

//inf
/obj/item/weapon/stock_parts/circuitboard/comm_traffic
	name = T_BOARD("telecommunications traffic control console")
	build_path = /obj/machinery/computer/telecomms/traffic
	origin_tech = list(TECH_DATA = 3)
