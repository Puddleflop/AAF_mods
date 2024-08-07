#include "script_component.hpp"

class DifficultyPresets {
	class CustomDifficulty {
		displayName = "AAF Difficulty";	// Name of the difficulty preset.
		class Options {
			/* Simulation */
			reducedDamage = 0;		// Reduced damage
			/* Situational awareness */
			groupIndicators = 0;	// Group indicators (0 = never, 1 = limited distance, 2 = always)
			friendlyTags = 0;		// Friendly name tags (0 = never, 1 = limited distance, 2 = always)
			enemyTags = 0;			// Enemy name tags (0 = never, 1 = limited distance, 2 = always)
			detectedMines = 0;		// Detected mines (0 = never, 1 = limited distance, 2 = always)
			commands = 0;			// Commands (0 = never, 1 = fade out, 2 = always)
			waypoints = 2;			// Waypoints (0 = never, 1 = fade out, 2 = always)
			tacticalPing = 0;		// Tactical ping (0 = disable, 1 = enable)
			/* Personal awareness */
			weaponInfo = 2;			// Weapon info (0 = never, 1 = fade out, 2 = always)
			stanceIndicator = 2;	// Stance indicator (0 = never, 1 = fade out, 2 = always)
			staminaBar = 0;			// Stamina bar
			weaponCrosshair = 0;	// Weapon crosshair
			visionAid = 0;			// Vision aid
			/* View */
			thirdPersonView = 2;	// 3rd person view (0 = disabled, 1 = enabled, 2 = enabled for vehicles only (Since  Arma 3 v1.99))
			cameraShake = 0;		// Camera shake
			/* Multiplayer */
			scoreTable = 0;			// Score table
			deathMessages = 0;		// Killed by
			vonID = 0;				// VoN ID
			/* Misc */
			mapContent = 0;			// Extended map content
			autoReport = 0;			// (former autoSpot) Automatic reporting of spotted enemied by players only. This doesn't have any effect on AIs.
			multipleSaves = 0;		// Multiple saves
		};
		// aiLevelPreset defines AI skill level and is counted from 0 and can have following values: 0 (Low), 1 (Normal), 2 (High), 3 (Custom).
		// when 3 (Custom) is chosen, values of skill and precision are taken from the class CustomAILevel.
		aiLevelPreset = 3;
	};
	class CustomAILevel
	{
		skillAI = 1;
		precisionAI = 1;
	};
};
