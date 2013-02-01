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
	
    // If it's set to go hostile on attack, do so.
	if ( GetLocalInt( OBJECT_SELF, "ACR_MAKE_HOSTILE" ) ) {
		ChangeToStandardFaction(OBJECT_SELF,STANDARD_FACTION_HOSTILE);
	}
	
	// A magical attack that deals cold or fire damage slows a flesh golem (as
	// the slowspell) for 2d6 rounds, with no saving throw.
	int nColdDamage = GetDamageDealtByType( DAMAGE_TYPE_COLD );
	int nFireDamage = GetDamageDealtByType( DAMAGE_TYPE_FIRE );
	if ( nColdDamage > 0 || nFireDamage > 0 ) {
		int nRounds = Random(6)+1 + Random(6)+1; 
		ApplyEffectToObject( DURATION_TYPE_TEMPORARY, EffectSlow(), OBJECT_SELF, RoundsToSeconds( nRounds ) );
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
		ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectHeal( nElectricDamage ), OBJECT_SELF );
		
		// Also, remove any slowing if it has any.
		RemoveEffect( OBJECT_SELF, EffectSlow() );
		
		// Are we giving a bonus?
		int nBonus = nElectricDamage / 3;
		if ( nBonus < 1 ) return;
		
		// Next we determine how much damage we've taken.
		int nDamageTaken = GetMaxHitPoints() - GetCurrentHitPoints();
		
		// Then we determine how much we heal, and how much we give as temporary HP.
		int nHealed = nBonus;
		int nTempHP = 0;
		if ( nHealed > nDamageTaken ) {
			nTempHP = nHealed - nBonus;
			nHealed = nBonus;
		}
		
		// Finally apply our effects.
		ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectHeal( nHealed ), OBJECT_SELF );
		ApplyEffectToObject( DURATION_TYPE_PERMANENT, EffectTemporaryHitpoints( nTempHP ), OBJECT_SELF );
	}
}