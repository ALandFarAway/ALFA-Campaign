#
# This project constructs ALFA-Campaign script resources.
#

!include $(PROJECT_SOURCE_ROOT)\makefile.def

NSS_FLAVOR=NWN2

NSS_INCLNSS=                                                   \
            $(OUTPUTDIR)\abr_golem_i.nss                       \
            $(OUTPUTDIR)\abr_kuotoa_i.nss                      

NSS_OBJECTS=                                                   \
            $(OUTPUTDIR)\abr_cre_onheartbeat_exaltedwhip.ncs   \
            $(OUTPUTDIR)\abr_cre_onphysically_kuotoa.ncs       \
            $(OUTPUTDIR)\abr_cre_onspawnin_kuotoa.ncs          \
            $(OUTPUTDIR)\abr_it_hex_blndfld_ay.ncs             \
            $(OUTPUTDIR)\abr_tcircle_ondisarmed.ncs            \
            $(OUTPUTDIR)\abr_tcircle_onenter.ncs               \
            $(OUTPUTDIR)\acf_cre_od_fleshgolem.ncs             \
            $(OUTPUTDIR)\acf_cre_od_troll.ncs                  \
            $(OUTPUTDIR)\acf_cre_oh_fleshgolem.ncs             \
            $(OUTPUTDIR)\acf_cre_oh_troll.ncs                  \
            $(OUTPUTDIR)\acf_cre_os_annis.ncs                  \
            $(OUTPUTDIR)\acf_cre_os_shadow.ncs                 \
            $(OUTPUTDIR)\acf_cre_os_shadowmastiff.ncs          \
            $(OUTPUTDIR)\as_group_alfa_abishais_black.ncs      \
            $(OUTPUTDIR)\as_group_alfa_abishais_blue.ncs       \
            $(OUTPUTDIR)\as_group_alfa_abishais_green.ncs      \
            $(OUTPUTDIR)\as_group_alfa_abishais_red.ncs        \
            $(OUTPUTDIR)\as_group_alfa_abishais_white.ncs      \
            $(OUTPUTDIR)\as_group_alfa_adventurers.ncs         \
            $(OUTPUTDIR)\as_group_alfa_bandits.ncs             \
            $(OUTPUTDIR)\as_group_alfa_bandit_gang.ncs         \
            $(OUTPUTDIR)\as_group_alfa_baneguard_squad.ncs     \
            $(OUTPUTDIR)\as_group_alfa_barghest_gr_pack.ncs    \
            $(OUTPUTDIR)\as_group_alfa_barghest_pack.ncs       \
            $(OUTPUTDIR)\as_group_alfa_black_bears.ncs         \
            $(OUTPUTDIR)\as_group_alfa_bodaks.ncs              \
            $(OUTPUTDIR)\as_group_alfa_bombardier_beetles.ncs  \
            $(OUTPUTDIR)\as_group_alfa_cheetah_family.ncs      \
            $(OUTPUTDIR)\as_group_alfa_dire_badgers.ncs        \
            $(OUTPUTDIR)\as_group_alfa_dire_rats.ncs           \
            $(OUTPUTDIR)\as_group_alfa_dire_rat_pack.ncs       \
            $(OUTPUTDIR)\as_group_alfa_drdwar_company.ncs      \
            $(OUTPUTDIR)\as_group_alfa_dungeon_1_3.ncs         \
            $(OUTPUTDIR)\as_group_alfa_dwarf_team.ncs          \
            $(OUTPUTDIR)\as_group_alfa_elf_squad.ncs           \
            $(OUTPUTDIR)\as_group_alfa_ettins.ncs              \
            $(OUTPUTDIR)\as_group_alfa_fire_btle_clster.ncs    \
            $(OUTPUTDIR)\as_group_alfa_flesh_golems.ncs        \
            $(OUTPUTDIR)\as_group_alfa_gargoyles.ncs           \
            $(OUTPUTDIR)\as_group_alfa_ghast_gang.ncs          \
            $(OUTPUTDIR)\as_group_alfa_ghast_pack.ncs          \
            $(OUTPUTDIR)\as_group_alfa_ghoul_gang.ncs          \
            $(OUTPUTDIR)\as_group_alfa_ghoul_pack.ncs          \
            $(OUTPUTDIR)\as_group_alfa_gnolls.ncs              \
            $(OUTPUTDIR)\as_group_alfa_gnoll_hunters.ncs       \
            $(OUTPUTDIR)\as_group_alfa_goblin_gang.ncs         \
            $(OUTPUTDIR)\as_group_alfa_goblin_patrol.ncs       \
            $(OUTPUTDIR)\as_group_alfa_goblin_raiders.ncs      \
            $(OUTPUTDIR)\as_group_alfa_halfling_scouts.ncs     \
            $(OUTPUTDIR)\as_group_alfa_hellhounds.ncs          \
            $(OUTPUTDIR)\as_group_alfa_hobgoblin_gang.ncs      \
            $(OUTPUTDIR)\as_group_alfa_hobgoblin_raiders.ncs   \
            $(OUTPUTDIR)\as_group_alfa_imps.ncs                \
            $(OUTPUTDIR)\as_group_alfa_kobold_gang.ncs         \
            $(OUTPUTDIR)\as_group_alfa_lions.ncs               \
            $(OUTPUTDIR)\as_group_alfa_lizardfolk_gang.ncs     \
            $(OUTPUTDIR)\as_group_alfa_merchants.ncs           \
            $(OUTPUTDIR)\as_group_alfa_militia.ncs             \
            $(OUTPUTDIR)\as_group_alfa_ogres.ncs               \
            $(OUTPUTDIR)\as_group_alfa_ogre_gang.ncs           \
            $(OUTPUTDIR)\as_group_alfa_orc_gang.ncs            \
            $(OUTPUTDIR)\as_group_alfa_orc_patrol.ncs          \
            $(OUTPUTDIR)\as_group_alfa_patrol.ncs              \
            $(OUTPUTDIR)\as_group_alfa_pirate_gang.ncs         \
            $(OUTPUTDIR)\as_group_alfa_pirate_patrol.ncs       \
            $(OUTPUTDIR)\as_group_alfa_shadow_gang.ncs         \
            $(OUTPUTDIR)\as_group_alfa_shadow_mastiffs.ncs     \
            $(OUTPUTDIR)\as_group_alfa_skeletons.ncs           \
            $(OUTPUTDIR)\as_group_alfa_south_grasslands.ncs    \
            $(OUTPUTDIR)\as_group_alfa_spdr_colny_small.ncs    \
            $(OUTPUTDIR)\as_group_alfa_temperate_clear.ncs     \
            $(OUTPUTDIR)\as_group_alfa_temperate_hills.ncs     \
            $(OUTPUTDIR)\as_group_alfa_troglodyte_clutch.ncs   \
            $(OUTPUTDIR)\as_group_alfa_vampire_spawn_pack.ncs  \
            $(OUTPUTDIR)\as_group_alfa_werewolves.ncs          \
            $(OUTPUTDIR)\as_group_alfa_wights.ncs              \
            $(OUTPUTDIR)\as_group_alfa_wight_gang.ncs          \
            $(OUTPUTDIR)\as_group_alfa_wolf_pack.ncs           \
            $(OUTPUTDIR)\as_group_alfa_wraiths.ncs             \
            $(OUTPUTDIR)\as_group_alfa_zombies.ncs             

all: scriptincludes $(NSS_OBJECTS)


script: scriptincludes $(NSS_OBJECTS)
	
scriptincludes:
	@copy /y *.nss $(OUTPUTDIR)\ >NUL

clean:
	@if exist $(OUTPUTDIR)\*.nss del $(OUTPUTDIR)\*.nss
	@if exist $(OUTPUTDIR)\*.ncs del $(OUTPUTDIR)\*.ncs
	@if exist $(OUTPUTDIR)\*.ndb del $(OUTPUTDIR)\*.ndb