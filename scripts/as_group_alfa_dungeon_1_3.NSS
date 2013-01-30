#include "acr_spawn_i"

void main();

void main() {


/* Dungeon EL 1-3

dire rat pack: d6 + 2 dire rats
fire beetle cluster: d4 + 1 fire beetles
spider colony small: d4+1 monstrous spiders, small
dwarf team: d3 + 1 dwarven warriors
elf squad: d3 + 1 elven warriors
goblin gang: d6 + 3 goblins
kobold gang: d6 + 3 kobolds
skeletons: 1d6
zombies: 1d4 + 1
hobgoblin gang: d6 + 3 hobgoblins
lizardfolk gang: 1d3 + 1
orc gang: 1d4 + 1
1 baneguard
ghoul gang: 1d3 + 1
1 shadow
gnolls: 1d2
spider: large monstrous 1
troglodyte: 1
quaggoth: 1
	1 tyrantfog zombie
	1 gel cube
	1d2 imps
	1d2 bomb beetle

	1 hobgoblin / 1d3 goblins
	1 were rat and 1d3 + 1 dire rats
	1d3 hob and 1d4+2 gob
	1 bugbear and 1d4+2 goblin
	1d4+2 gobs and 1d3 wolves
	1d3 hob and 1d3 wolves
	1d6+3 kobold and 1 dire weasel
	
	1d3+1 large skeleton
	1d3 spider, medium
	1 lemure
	
	1d2 dire badger	
*/	

	int nRoll = d100();
	int i;
	
	if (nRoll <= 4) ACR_SpawnGroup("alfa_dire_rats");
	else if (nRoll <= 8) ACR_SpawnGroup("alfa_fire_beetle_cluster");
	else if (nRoll <= 12) ACR_SpawnGroup("alfa_spider_colony_small");
	else if (nRoll <= 16) ACR_SpawnGroup("alfa_dwarf_team");
	else if (nRoll <= 20) ACR_SpawnGroup("alfa_elf_squad");
	else if (nRoll <= 24) ACR_SpawnGroup("alfa_goblin_gang");
	else if (nRoll <= 28) ACR_SpawnGroup("alfa_kobold_gang");
	else if (nRoll <= 32) ACR_SpawnGroup("alfa_skeletons");
	else if (nRoll <= 36) ACR_SpawnGroup("alfa_zombies");
	else if (nRoll <= 40) ACR_SpawnGroup("alfa_hobgoblin_gang");
	else if (nRoll <= 44) ACR_SpawnGroup("alfa_lizardfolk_gang");
	else if (nRoll <= 48) ACR_SpawnGroup("alfa_orc_gang");
	else if (nRoll <= 52) ACR_SpawnObject("abr_cr_un_baneguard", OBJECT_TYPE_CREATURE);
	else if (nRoll <= 56) ACR_SpawnGroup("alfa_ghoul_gang");
	else if (nRoll <= 60) ACR_SpawnObject("abr_cr_un_shadow", OBJECT_TYPE_CREATURE);
	else if (nRoll <= 64) ACR_SpawnGroup("alfa_gnolls");
	else if (nRoll <= 68) ACR_SpawnObject("abr_cr_ve_spider_large", OBJECT_TYPE_CREATURE);
	else if (nRoll <= 72) ACR_SpawnObject("abr_cr_un_zombie_tyrantfog", OBJECT_TYPE_CREATURE);
	else if (nRoll <= 78) ACR_SpawnObject("abr_cr_oo_gelatinouscube", OBJECT_TYPE_CREATURE);
	else if (nRoll <= 84) ACR_SpawnGroup("alfa_imps");
	else if (nRoll <= 90) ACR_SpawnGroup("alfa_bombardier_beetles");
	else if (nRoll <= 95) ACR_SpawnGroup("alfa_dire_badgers");
	else ACR_SpawnObject("abr_cr_mh_quaggoth", OBJECT_TYPE_CREATURE);
		
}
