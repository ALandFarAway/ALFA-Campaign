////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Configuration File
//     Filename : acf_cre_od_troll
//
//  Description
//  This script is called whenever a troll is damaged. All damage that isn't
//  fire or acid is counted as nonlethal damage.
//
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

#include "acr_creature_i"
#include "acr_nonlethal_i"

////////////////////////////////////////////////////////////////////////////////
// Constants ///////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Structures //////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Global Variables ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Function Prototypes /////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

void main() {
    ACR_CreatureOnDamaged();
	
	// Get our creatures.
	object oDamager = GetLastDamager();
	object oTroll = OBJECT_SELF;
	
    // If it's set to go hostile on attack, do so.
	if ( GetLocalInt( oTroll, "ACR_MAKE_HOSTILE" ) ) {
		ChangeToStandardFaction( oTroll, STANDARD_FACTION_HOSTILE );
	}
	
	// Creatures with this extraordinary ability recover from wounds quickly
	// and can even regrow or reattach severed body parts. Damage dealt to the
	// creature is treated as nonlethal damage, and the creature automatically
	// cures itself of nonlethal damage at a fixed rate per round, as given in
	// the creature’s entry.
	
	// First, get our damages.
	int nTotalDamage = GetTotalDamageDealt();
	int nAcidDamage = GetDamageDealtByType( DAMAGE_TYPE_ACID );
	int nFireDamage = GetDamageDealtByType( DAMAGE_TYPE_FIRE );
	int nPhysicalDamage = GetDamageDealtByType( DAMAGE_TYPE_BLUDGEONING || DAMAGE_TYPE_PIERCING || DAMAGE_TYPE_SLASHING );
	
	// Determine how much of it isn't from acid/fire.
	int nNonLethalDamage = nTotalDamage;
	if ( nAcidDamage != -1 ) nNonLethalDamage -= nAcidDamage;
	if ( nFireDamage != -1 ) nNonLethalDamage -= nFireDamage;
	
	// Deal our damage as nonlethal damage.
	if ( nNonLethalDamage > 0 ) {
		// Swap the non-fire, non-acid damage to nonlethal.
		ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectHeal( nNonLethalDamage ), oTroll );
		ACR_ApplyNonlethalDamageToCreature( oTroll, nNonLethalDamage );
		
		// Prepare some feedback to our attacker.
		string sMessage;
		if ( nNonLethalDamage == nTotalDamage ) {
			sMessage = "The creature seems to be regenerating all of your damage!";
		} else {
			sMessage = "The creature seems to be regenerating some of your damage.";
		}
		FloatingTextStringOnCreature( sMessage, oDamager, FALSE, 2.0f );
	}
	
	// A regenerating creature that has been rendered unconscious through
	// nonlethal damage can be killed with a coup de grace. The attack cannot
	// be of a type that automatically converts to nonlethal damage. 
	if ( _GetNLDState( oTroll ) == ACR_NLD_STATE_HELPLESS && ( nAcidDamage > 0 || nFireDamage > 0 ) ) {
		SetImmortal( oTroll, FALSE );
		AssignCommand( oDamager, ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectDeath(), oTroll ) );
		return;
	}
}