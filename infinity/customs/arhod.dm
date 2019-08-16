//necklace

/obj/item/clothing/accessory/necklace/messa //arhod's custom item
	name = "messa amulet"
	desc = "������������ �� ������ ����� � ������ ������ � ��������� �������� �� ������������� ������, \
	���������� ����� ���������. ������ ���������� ����� �������������, ������������� ��������� ����� - \
	������ ���� �����. ��������&#255;, ��� ����� �������� ��� ������� ��&#255;��� ����� ����� ����� �� ����&#255; \
	���&#255;����������� �������. ����� ��� ���� ���������� ����� \"�������\", ��������&#255; � ����� ������, \
	��� ���� �� ����� ������������ � ��������� ������� ��&#255;��� ����������&#255;."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "messa_amulet"
	accessory_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB, slot_wear_suit_str = CUSTOM_ITEM_MOB)

//a gun

/obj/item/weapon/gun/energy/gun/secure/messith
	name = "messith pistol"
	desc = "�������� \"������\" &#255;��&#255;���&#255; ������������������� ������� ������������ '������������', ����������������� ��� ������-������. ������ �������� ������&#255; ���� ������ ����� '�������', ��� ��������� ������ ������&#255; �� �����&#255; '�������', ��� � ��� �������. ��� ������&#255; ����������� � ������� �� ������������ ����������� '������' - ��������� ����� � ����������&#255; ����&#255;���, ������&#255;���&#255; �����&#255;�� ������ ������ ����������&#255; � ����������, �� ����� - ����������� � ������� �������� ������ ��� �������� � ��������� ������. �� ������, ���&#255; �� �����, ���������� ������� �����&#255; ��������� ������� 'Var Dar Fusozai'"
	icon_state = "messithstun"
	modifystate = "messithstun"
	icon = 'icons/obj/infinity_items/messith.dmi'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/guns/guns_l.dmi',
		slot_r_hand_str = 'icons/mob/onmob/guns/guns_r.dmi',
		)
	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun, modifystate="messithstun"),
		list(mode_name="shock", projectile_type=/obj/item/projectile/beam/stun/shock, modifystate="messithshock"),
		list(mode_name="kill", projectile_type=/obj/item/projectile/beam, modifystate="messithkill"),
		)

/obj/item/weapon/gun/energy/gun/secure/messith/New()
	..()
	Scale(0.8, 0.8)
	Translate(-8, 0)

/obj/item/custkit/messith
	name = "messith customization kit"
	input = /obj/item/weapon/gun/energy/gun/secure
	output = /obj/item/weapon/gun/energy/gun/secure/messith

//zippo

/obj/item/weapon/flame/lighter/zippo/custom/messotha
	name = "messotha zippo"
	desc = "�����&#255; ��������� ��, �� ���������, ������� �� ����� ������� � ������ ���������� �����������. \
	��������� ��������� ��������� ����&#255;, ����������� ��&#255;; ���������� &#255;�����&#255;. \
	�� ������� ������� ��������&#255; ����� 27 �� ���������� �������: \
	\"27 �������. ���� �� ����� ��� ����� �� ��� ���� - ���-�� �� �����!\". �� �������� ������� ��, ���������: \
	\"�� ����������, ��������� ����������, �������� ����������� ��&#255; �������������. ���&#255;�� ����� ������� ����\"."
	icon = 'infinity/icons/obj/lighters.dmi'
	icon_state = "messotha"
