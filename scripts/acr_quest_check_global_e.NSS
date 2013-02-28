// Returns TRUE if the quest variable is equal to [value].

#include "acr_db_persist_i"

int StartingConditional(string plot, int value)
{
    object oPC = GetPCSpeaker();
	string name = "i_qst_"+plot;
	
	if (ACR_GetPersistentInt(oPC, name) == value)
		return TRUE;
		
	return FALSE;
}