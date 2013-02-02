////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Configuration File
//     Filename : acf_cre_od_fleshgolem
//
//  Description
//  This script is called whenever a Flesh Golem is damaged. If the damage is
//  fire or ice, we slow down. If it is electrical, remove any slowdown.
//
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

#include "acr_creature_i"

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
	object oGolem = OBJECT_SELF;
	
    // If it's set to go hostile on attack, do so.
	if ( GetLocalInt( oGolem, "ACR_MAKE_HOSTILE" ) ) {
		ChangeToStandardFaction(oGolem,STANDARD_FACTION_HOSTILE);
	}
	
	// A magical attack that deals cold or fire damage slows a flesh golem (as
	// the slowspell) for 2d6 rounds, with no saving throw.
	int nColdDamage = GetDamageDealtByType( DAMAGE_TYPE_COLD );
	int nFireDamage = GetDamageDealtByType( DAMAGE_TYPE_FIRE );
	if ( nColdDamage > 0 || nFireDamage > 0 ) {
		int nRounds = Random(6)+1 + Random(6)+1; 
		ApplyEffectToObject( DURATION_TYPE_TEMPORARY, EffectSlow(), oGolem, RoundsToSeconds( nRounds ) );
		FloatingTextStringOnCreature( "*The construct slows.*", oGolem, FALSE );
	}
	
	// A magical attack that deals electricity damage breaks any slow effect on
	// the golem and heals 1 point of damage for every 3 points of damage the
	// attack would otherwise deal. If the amount of heal-ing would cause the
	// golem to exceed its full normal hit points, it gains any excess as
	// temporary hit points.
	int nElectricDamage = GetDamageDealtByType( DAMAGE_TYPE_ELECTRICAL );
	if ( nElectricDamage > 0 ) {
		// First, heal up all the damage done via electricity. Flesh golems are
		// immune to this damage type.
		ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectHeal( nElectricDamage ), oGolem );
		FloatingTextStringOnCreature( "*Its wounds magical begin closing.*", oGolem, FALSE );
		
		// Also, remove any slowing if it has any.
		RemoveEffect( oGolem, EffectSlow() );
		
		// Are we giving a bonus?
		int nHealAmount = nElectricDamage / 3;
		if ( nHealAmount < 1 ) return;
		
		// Finally apply our effects.
		ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectHeal( nHealAmount ), oGolem );
	}
	
	// Because we need to have this creature be Immortal for our electricity damage handling to work,
	// we now want to see if this creature should now be dead. For now we just assume that 1hp=dead.
	// To suppliment this we add 1 to the creature's maximum life.
	if ( GetCurrentHitPoints() == 1 ) {
		SetImmortal( oGolem, FALSE );
		AssignCommand( oDamager, ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectDeath(), oGolem ) );
	}
}