/obj/item/clothing/suit/armor/pcarrier/troops
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor/tag/solgov)

/obj/item/clothing/suit/armor/pcarrier/troops/heavy
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/armguards, /obj/item/clothing/accessory/legguards, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor/tag/solgov)

/obj/item/clothing/suit/armor/pcarrier/troops/medical
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor/tag/medical)

/obj/item/clothing/head/helmet/solgov/green
	starting_accessories = list(/obj/item/clothing/accessory/armor/helmcover/green)

/obj/item/clothing/head/helmet/solgov/tan
	starting_accessories = list(/obj/item/clothing/accessory/armor/helmcover/tan)

/obj/item/clothing/head/helmet/solgov/navy
	starting_accessories = list(/obj/item/clothing/accessory/armor/helmcover/navy)

/obj/item/clothing/under/solgov/pt/expeditionary/resomi
	name = "small expeditionary pt smock"
	desc = "It looks fitted to nonhuman proportions."
	icon = 'icons/obj/clothing/species/resomi/uniform.dmi'
	icon_state = "resomi_expeditionpt"
	worn_state = "resomi_expeditionpt"
	species_restricted = list(SPECIES_RESOMI)

/obj/item/clothing/under/solgov/utility/expeditionary/resomi
	name = "small expeditionary uniform"
	desc = "It looks fitted to nonhuman proportions."
	icon = 'icons/obj/clothing/species/resomi/uniform.dmi'
	icon_state = "resomi_blackutility"
	worn_state = "resomi_blackutility"
	species_restricted = list(SPECIES_RESOMI)

/obj/item/clothing/under/solgov/mildress/expeditionary/officer/resomi
	name = "small expeditionary officer's uniform"
	desc = "It looks fitted to nonhuman proportions."
	icon = 'icons/obj/clothing/species/resomi/uniform.dmi'
	icon_state = "resomi_blackutility_com"
	worn_state = "resomi_blackutility_com"
	species_restricted = list(SPECIES_RESOMI)

/obj/item/clothing/under/solgov/utility/expeditionary/command/resomi
	starting_accessories = list(/obj/item/clothing/accessory/solgov/department/command)

/obj/item/clothing/under/solgov/mildress/expeditionary/resomi
	name = "small expeditionary dress uniform"
	desc = "It looks fitted to nonhuman proportions."
	icon = 'icons/obj/clothing/species/resomi/uniform.dmi'
	icon_state = "resomi_greydress"
	worn_state = "resomi_greydress"
	species_restricted = list(SPECIES_RESOMI)

/obj/item/clothing/under/solgov/fleet/special
	name = "special fleet utility"
	icon = 'icons/obj/clothing/infinity/uniform.dmi'
	icon_override = 'icons/mob/infinity/uniform.dmi'
	icon_state = "fleet"
	worn_state = "fleet"

/obj/item/clothing/under/solgov/fleet/special/officer
	name = "special fleet command utility"
	icon_state = "fleet_of"
	starting_accessories = list(/obj/item/clothing/accessory/solgov/department/command/fleet)

/obj/item/clothing/under/solgov/fleet/special/officer/commander
	name = "special fleet high command uniform"
	icon_state = "fleet_com"
	starting_accessories = list(/obj/item/clothing/accessory/solgov/department/command/fleet)

/obj/item/clothing/head/soft/solgov/fleet_special
	name = "\improper Special Fleet cap"
	desc = "A navy blue utility cover bearing the crest of the SCG Fleet."
	icon = 'icons/obj/clothing/infinity/hats.dmi'
	icon_override = 'icons/mob/infinity/hats.dmi'
	icon_state = "fleetsoft"