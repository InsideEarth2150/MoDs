mission "IEO-Arena"
{
	consts
	{
		//comboRoundsNumber
		ROUNDS_NUMBER_1            = 0;
		ROUNDS_NUMBER_2            = 1;
		ROUNDS_NUMBER_3            = 2;
		ROUNDS_NUMBER_4            = 3;
		ROUNDS_NUMBER_5            = 4;
		ROUNDS_NUMBER_8            = 5;
		ROUNDS_NUMBER_10           = 6;
		ROUNDS_NUMBER_15           = 7;
		ROUNDS_NUMBER_20           = 8;
		ROUNDS_NUMBER_UNLIMITED    = 9;

		//comboRoundTimeLimit
		ROUND_TIME_LIMIT_1MIN         = 0;
		ROUND_TIME_LIMIT_2MIN         = 1;
		ROUND_TIME_LIMIT_3MIN         = 2;
		ROUND_TIME_LIMIT_4MIN         = 3;
		ROUND_TIME_LIMIT_5MIN         = 4;
		ROUND_TIME_LIMIT_UNLIMITED    = 5;

		//comboTechLevel
		TECH_LEVEL_LOW               = 0;
		TECH_LEVEL_MEDIUM            = 1;
		TECH_LEVEL_HIGH              = 2;
		TECH_LEVEL_PROGRESSIVE       = 3;
		TECH_LEVEL_MIXED             = 4;
		TECH_LEVEL_RANDOM            = 5;
		TECH_LEVEL_RANDOM_PER_PLAYER = 6;
		
		//comboUnitComposition
		UNIT_COMP_FIXED                = 0;
		UNIT_COMP_RANDOM               = 1;
		UNIT_COMP_UNIFORM              = 2;
		UNIT_COMP_X_FACTION_CONSTANT   = 3;
		UNIT_COMP_X_FACTION_RANDOM     = 4;
		UNIT_COMP_X_FACTION_UNIFORM    = 5;
		UNIT_COMP_MIXED_FACTION_RANDOM = 6;

		//comboStartingUnits
		STARTING_UNITS_1             = 0;
		STARTING_UNITS_2             = 1;
		STARTING_UNITS_3             = 2;
		STARTING_UNITS_4             = 3;
		STARTING_UNITS_5             = 4;
		STARTING_UNITS_8             = 5;
		STARTING_UNITS_10            = 6;
		STARTING_UNITS_15            = 7;
		STARTING_UNITS_20            = 8;
		STARTING_UNITS_1_KEEP_ALIVE  = 9;
		STARTING_UNITS_2_KEEP_ALIVE  = 10;
		STARTING_UNITS_3_KEEP_ALIVE  = 11;
		STARTING_UNITS_4_KEEP_ALIVE  = 12;
		STARTING_UNITS_5_KEEP_ALIVE  = 13;
		STARTING_UNITS_8_KEEP_ALIVE  = 14;
		STARTING_UNITS_10_KEEP_ALIVE = 15;
		STARTING_UNITS_15_KEEP_ALIVE = 16;
		STARTING_UNITS_20_KEEP_ALIVE = 17;
		
		//comboWeather
		WEATHER_OFF                  = 0;
		WEATHER_DYNAMIC              = 1;
		WEATHER_RAIN                 = 2;
		WEATHER_SNOW                 = 3;
		WEATHER_RAINSTORM            = 4;
		WEATHER_METEORS              = 5;
		WEATHER_ARMAGEDDON           = 6;

		//shieldLevel
		SHIELD_NONE           = 0; 
		SHIELD_SMALL          = 1;
		SHIELD_MEDIUM         = 2;
		SHIELD_LARGE          = 3;
		
		DATA_POINTS = 0;
		DATA_ROUND_POINTS = 1;
		DATA_UNIT_TECH = 2;
		DATA_UNIT_FACTION = 3;
		DATA_UNIT_CLASS = 4;
		DATA_UNIT_INDEX = 5;
		DATA_SPAWN_INDEX = 6;
		DATA_SPAWN_ASSIGNED = 7;
		DATA_CENTER_X = 8;
		DATA_CENTER_Y = 9;
		
		FRAG_REWARD = 1;
		
		CLASS_LIGHT_KINETIC = 0;
		CLASS_LIGHT_ENERGY = 1;
		CLASS_MEDIUM_KINETIC = 2;
		CLASS_MEDIUM_ENERGY = 3;
		CLASS_HEAVY_KINETIC = 4;
		CLASS_HEAVY_ENERGY = 5;
		CLASS_ART = 6;
		CLASS_HERO = 7;
		
		WEATHER_EFFECT_DURATION = 1200; // 1min
	}

	enum comboRoundsNumber
	{
		"1",
		"2",
		"3",
		"4",
		"5",
		"8",
		"10",
		"15",
		"20",
		"Unlimited",
	multi:
		"Number of rounds"
	}
	
	enum comboRoundTimeLimit
	{
		"1 min",
		"2 min",
		"3 min",
		"4 min",
		"5 min",
		"Unlimited",
	multi:
		"Round time limit"
	}

	enum comboTechLevel
	{
		"translateGameMenuTechLevelLow",
		"translateGameMenuTechLevelMedium",
		"translateGameMenuTechLevelHigh",
		"Progressive",
		"Mixed",
		"Random",
		"Random per player",
	multi:
		"translateGameMenuTechLevel"
	}

	enum comboUnitComposition
	{
		"Fixed",
		"Random",
		"Uniform",
		"X-faction fixed",
		"X-faction random",
		"X-faction uniform",
		"Mixed faction random",
	multi:
		"Unit composition"
	}

	enum comboStartingUnits
	{
		"1",
		"2",
		"3",
		"4",
		"5",
		"8",
		"10",
		"15",
		"20",
		"1 (keep alive)",
		"2 (keep alive)",
		"3 (keep alive)",
		"4 (keep alive)",
		"5 (keep alive)",
		"8 (keep alive)",
		"10 (keep alive)",
		"15 (keep alive)",
		"20 (keep alive)",
	multi:
		"Number of units"
	}

	enum comboWeather
	{
		"Off",
		"Dynamic",
		"Rain",
		"Snow",
		"Rainstorm",
		"Meteor rain",
		"Armageddon",
	multi:
		"Weather"
	}

	int NumberOfUnits;
	int ResetUnits;
	int NumberOfRounds;
	int RoundTimeLimit;
	int ArmageddonInProgress;
	
	int RoundNumber;
	int HeroesImmortal;
	int RoundTimer;
	int RoundPlayersLeft;
	int CurrentTechLevel;
	
	int FraggingDisabled;
	
	int BestScore;
	int BestPlayer;
	int BestRoundScore;
	int BestRoundPlayer;
	int BestPrevRoundScore;
	int BestPrevRoundPlayer;

// Functions below are helpers to spawn units. They also save them as "script units" for tracking.
// There is also a hack, thats sets RecyclePercent to a value that helps identify the unit later:
// 0 - default
// 1 - civil units
// 2 - units with external ammo supply
// 3 - hero Grizzly
// 4 - hero UFO

//=============LC=============
	function int Spawn_Moon_MG(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUMO3", "LCWCH2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Moon_E(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUMO3", "LCWSL2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Moon_P(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUMO3", "LCWNH", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Moon_R(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUMO3", "LCWSR3", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Moon_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUMO3", "LCBANNER", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(1); }
	function int Spawn_NewHope_MG(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUNH", "LCWCH2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_NewHope_E(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUNH", "LCWSL2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_NewHope_P(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUNH", "LCWNH", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_NewHope_R(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUNH", "LCWSR3", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_NewHope_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUNH", "LCBANNER", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(1); }
	function int Spawn_Crater_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUCR3", "LCWMR3", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Crater_He_P(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUCR3", "LCWHL2", null, "LCWNH", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Crater_He_E(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUCR3", "LCWHL2", null, "LCWSL2", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Crater_He_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUCR3", "LCWHL2", null, "LCBANNER", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Crater_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUCR3", "LCBANNER", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(1); }
	function int Spawn_Crusher_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUCU3", "LCWMR3", "LCWMR3", null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Crusher_He_P(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUCU3", "LCWHL2", "LCWHL2", "LCWNH", "LCWNH", shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Crusher_He_E(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUCU3", "LCWHL2", "LCWHL2", "LCWSL2", "LCWSL2", shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Crusher_He_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUCU3", "LCWHL2", "LCWHL2", "LCWSL2", "LCBANNER", shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Crusher_hR_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUCU3", "LCWMR3", "LCBANNER", null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Crion_Art(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUHT1", "LCWHC1", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }

//=============ED=============
	function int Spawn_Pamir_C(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUST3", "EDWCA2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Pamir_R(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUST3", "EDWSR2AB", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Taiga_MG(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUOH2", "EDWCH2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Taiga_L(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUOH2", "EDWSL2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Taiga_R(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUOH2", "EDWSR3", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Taiga_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUOH2", "EDBANNER", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(1); }
	function int Spawn_Caspian_MG(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUMW3", "EDWCH2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Caspian_L(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUMW3", "EDWSL2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Caspian_R(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUMW3", "EDWSR3", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Caspian_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUMW3", "EDBANNER", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(1); }
	function int Spawn_Siberia_MG(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUMT3", "EDWCH2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Siberia_L(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUMT3", "EDWSL2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Siberia_R(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUMT3", "EDWSR3", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Siberia_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUMT3", "EDBANNER", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(1); }
	function int Spawn_Kaukas_hC_MG(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUHT3", "EDWHC2", null, "EDWCH2", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Kaukas_hC_R(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUHT3", "EDWHC2", null, "EDWSR3", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Kaukas_hC_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUHT3", "EDWHC2", null, "EDBANNER", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Kaukas_hL_L(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUHT3", "EDWHL1", null, "EDWSL1", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Kaukas_hL_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUHT3", "EDWHL1", null, "EDBANNER", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Kaukas_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUHT3", "EDWMR3", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Kaukas_Art(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUHT3", "EDWART", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Ural_hC_MG(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUBT2", "EDWHC2", "EDWHC2", "EDWCH2", "EDWCH2", shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Ural_hC_R(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUBT2", "EDWHC2", "EDWHC2", "EDWSR3", "EDWSR3", shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Ural_hC_R_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUBT2", "EDWHC2", "EDWHC2", "EDWSR3", "EDBANNER", shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Ural_hL_L(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUBT2", "EDWHL1", "EDWHL1", "EDWSL1", "EDWSL1", shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Ural_hL_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUBT2", "EDWHL1", "EDWHL1", "EDWSL1", "EDBANNER", shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Ural_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUBT2", "EDWMR3", "EDWMR3", null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Ural_Art(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUBT2", "EDWART", "EDWART", null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }

//=============UCS=============
	function int Spawn_Tiger_MG(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUSL3", "UCSWTCH2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Tiger_C(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUSL3", "UCSWTSC2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Tiger_P(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUSL3", "UCSWTSP2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Tiger_R(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUSL3", "UCSWTSR3", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Tiger_G(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUSL3", "UCSWTSG2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Spider_MG(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUML3", "UCSWSCH2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Spider_P(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUML3", "UCSWSSP2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Spider_R(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUML3", "UCSWSSR3", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Spider_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUML3", "UCSWSMR2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Spider_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUML3", "UCSBANNER", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(1); }
	function int Spawn_Panther_hC_MG(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUHL3", "UCSWBHC2", null, "UCSWSCH2", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Panther_hC_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUHL3", "UCSWBHC2", null, "UCSWSMR2", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Panther_hC_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUHL3", "UCSWBHC2", null, "UCSBANNER", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Panther_hP(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUHL3", "UCSWBHP2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Panther_hP_P(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUHL3", "UCSWBHP3", null, "UCSWSSP2", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Panther_hP_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUHL3", "UCSWBHP3", null, "UCSBANNER", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Panther_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUHL3", "UCSWBMR3", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Panther_R_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUHL3", "UCSWBSR3", null, "UCSWSMR2", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Panther_hG(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUHL3", "UCSWBHG2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Jaguar_hC_MG(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUBL2", "UCSWBHC2", "UCSWSCH2", "UCSWSCH2", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Jaguar_hC_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUBL2", "UCSWBHC2", "UCSWSMR2", "UCSWSMR2", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Jaguar_hC_hR_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUBL2", "UCSWBHC2", "UCSBANNER", "UCSWSMR2", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Jaguar_hP_P(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUBL2", "UCSWBHP3", "UCSWSSP2", "UCSWSSP2", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Jaguar_hP_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUBL2", "UCSWBHP3", "UCSBANNER", "UCSWSSP2", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Jaguar_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUBL2", "UCSWBMR3", "UCSWSMR2", null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Jaguar_R_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUBL2", "UCSWBSR3", "UCSWSMR2", "UCSWSMR2", null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Jaguar_hG_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUBL2", "UCSWBHG2", "UCSWSMR2", null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Jaguar_hG_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUBL2", "UCSWBHG2", "UCSBANNER", null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Salamander_MG(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUCS", "UCSWSCH2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Salamander_P(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUCS", "UCSWSSP2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(0); }
	function int Spawn_Salamander_R(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUCS", "UCSWSSR3", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Salamander_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUCS", "UCSWSMR2", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_Salamander_Banner(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSUCS", "UCSBANNER", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(1); }

//=============MAD MAXES=============
	function int Spawn_MadMaxTank_hC(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUMM31", "EDWMM42", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_MadMaxTank_hC_Alt(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUMM31", "EDWMM21", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_MadMaxTank_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUMM31", "EDWMM31", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_MadMaxAltTank_hC(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUMM41", "EDWMM42", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_MadMaxAltTank_hC_Alt(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUMM41", "EDWMM21", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }
	function int Spawn_MadMaxAltTank_hR(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "EDUMM41", "EDWMM31", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(2); }

//=============HERO=============
	function int Spawn_Hero_Grizzly_hP(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "UCSU4L3", "UCSWDHP2", "UCSWSSP2", null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(3); }
	function int Spawn_Hero_UFO(player owner, int unitNumber, int x, int y, int z, int shieldLevel) { unitex u; u = owner.CreateUnitEx(x, y, z, "AdvancedTank", "LCUUFO", "LCWUFO", null, null, null, shieldLevel - 1); owner.SetScriptUnit(unitNumber, u); u.SetObjectRecyclePercent(4); }

	function int GetRandomClass(player owner)
	{
		int i;
		i = Rand(100);
		
		if (owner.GetScriptData(DATA_UNIT_TECH) == TECH_LEVEL_MIXED)
		{
			if (i < 15) return CLASS_LIGHT_KINETIC;
			else if (i < 30) return CLASS_LIGHT_ENERGY;
			else if (i < 45) return CLASS_MEDIUM_KINETIC;
			else if (i < 60) return CLASS_MEDIUM_ENERGY;
			else if (i < 70) return CLASS_HEAVY_KINETIC;
			else if (i < 85) return CLASS_HEAVY_ENERGY;
			else if (i < 98) return CLASS_ART;
			else return CLASS_HERO;
		}
		else if (owner.GetScriptData(DATA_UNIT_TECH) == TECH_LEVEL_LOW)
		{
			if (i < 50) return CLASS_LIGHT_KINETIC;
			else return CLASS_LIGHT_ENERGY;
		}
		else if (owner.GetScriptData(DATA_UNIT_TECH) == TECH_LEVEL_MEDIUM)
		{
			if (i < 50) return CLASS_MEDIUM_KINETIC;
			else return CLASS_MEDIUM_ENERGY;
		}
		else
		{
			if (i < 30) return CLASS_HEAVY_KINETIC;
			else if (i < 67) return CLASS_HEAVY_ENERGY;
			else if (i < 95) return CLASS_ART;
			else return CLASS_HERO;
		}
	}
	
	function int GetRandomUnitIndex(player owner, int faction, int unitClass)
	{
		if (faction == raceLC)
		{
			if (unitClass == CLASS_LIGHT_KINETIC) return Rand(4);
			else if (unitClass == CLASS_LIGHT_ENERGY) return Rand(4);
			else if (unitClass == CLASS_MEDIUM_KINETIC) return Rand(1);
			else if (unitClass == CLASS_MEDIUM_ENERGY) return Rand(3);
			else if (unitClass == CLASS_HEAVY_KINETIC) return Rand(2);
			else if (unitClass == CLASS_HEAVY_ENERGY) return Rand(3);
			else if (unitClass == CLASS_ART) return Rand(1);
			else if (unitClass == CLASS_HERO) return Rand(2);
		}
		else if (faction == raceED)
		{
			if (unitClass == CLASS_LIGHT_KINETIC) return Rand(8);
			else if (unitClass == CLASS_LIGHT_ENERGY) return Rand(3);
			else if (unitClass == CLASS_MEDIUM_KINETIC) return Rand(4);
			else if (unitClass == CLASS_MEDIUM_ENERGY) return Rand(2);
			else if (unitClass == CLASS_HEAVY_KINETIC) return Rand(4);
			else if (unitClass == CLASS_HEAVY_ENERGY) return Rand(2);
			else if (unitClass == CLASS_ART) return Rand(2);
			else if (unitClass == CLASS_HERO) return Rand(2);
		}
		else if (faction == raceUCS)
		{
			if (unitClass == CLASS_LIGHT_KINETIC) return Rand(10);
			else if (unitClass == CLASS_LIGHT_ENERGY) return Rand(3);
			else if (unitClass == CLASS_MEDIUM_KINETIC) return Rand(5);
			else if (unitClass == CLASS_MEDIUM_ENERGY) return Rand(3);
			else if (unitClass == CLASS_HEAVY_KINETIC) return Rand(5);
			else if (unitClass == CLASS_HEAVY_ENERGY) return Rand(2);
			else if (unitClass == CLASS_ART) return Rand(3);
			else if (unitClass == CLASS_HERO) return Rand(2);
		}
		else if (faction == 4/*MadMaxes*/)
		{
			if (unitClass == CLASS_HERO)
				return Rand(2);
			return Rand(6);
		}
	}
	
	function int SpawnRandomizedUnit(player owner, int unitNumber, int x, int y, int z, int faction, int unitClass, int unitIndex)
	{
		if (faction == raceLC)
		{
			if (unitClass == CLASS_LIGHT_KINETIC)
			{
				if (unitIndex == 0)
					Spawn_Moon_MG(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 1)
					Spawn_Moon_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 2)
					Spawn_NewHope_MG(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 3)
					Spawn_NewHope_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
			}
			else if (unitClass == CLASS_LIGHT_ENERGY)
			{
				if (unitIndex == 0)
					Spawn_Moon_E(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 1)
					Spawn_Moon_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 2)
					Spawn_NewHope_E(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 3)
					Spawn_NewHope_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
			}
			else if (unitClass == CLASS_MEDIUM_KINETIC)
			{
				Spawn_Crater_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			}
			else if (unitClass == CLASS_MEDIUM_ENERGY)
			{
				if (unitIndex == 0)
					Spawn_Crater_He_E(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitIndex == 1)
					Spawn_Crater_He_P(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitIndex == 2)
					Spawn_Crater_He_Banner(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			}
			else if (unitClass == CLASS_HEAVY_KINETIC)
			{
				if (unitIndex == 0)
					Spawn_Crusher_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 1)
					Spawn_Crusher_hR_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
			}
			else if (unitClass == CLASS_HEAVY_ENERGY)
			{
				if (unitIndex == 0)
					Spawn_Crusher_He_E(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 1)
					Spawn_Crusher_He_P(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 2)
					Spawn_Crusher_He_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
			}
			else if (unitClass == CLASS_ART)
			{
				Spawn_Crion_Art(owner, unitNumber, x, y, z, SHIELD_LARGE);
			}
			else // hero
			{
				if (unitIndex == 0)
					Spawn_Hero_Grizzly_hP(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 1)
					Spawn_Hero_UFO(owner, unitNumber, x, y, z, SHIELD_LARGE);
			}
		}
		else if (faction == raceED)
		{
			if (unitClass == CLASS_LIGHT_KINETIC)
			{
				if (unitIndex == 0)
					Spawn_Pamir_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 1)
					Spawn_Pamir_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 2)
					Spawn_Taiga_MG(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 3)
					Spawn_Taiga_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 4)
					Spawn_Caspian_MG(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 5)
					Spawn_Caspian_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 6)
					Spawn_Siberia_MG(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 7)
					Spawn_Siberia_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
			}
			else if (unitClass == CLASS_LIGHT_ENERGY)
			{
				if (unitIndex == 0)
					Spawn_Taiga_L(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 1)
					Spawn_Caspian_L(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 2)
					Spawn_Siberia_L(owner, unitNumber, x, y, z, SHIELD_SMALL);
			}
			else if (unitClass == CLASS_MEDIUM_KINETIC)
			{
				if (unitIndex == 0)
					Spawn_Kaukas_hC_MG(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitIndex == 1)
					Spawn_Kaukas_hC_R(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitIndex == 2)
					Spawn_Kaukas_hC_Banner(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitIndex == 3)
					Spawn_Kaukas_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			}
			else if (unitClass == CLASS_MEDIUM_ENERGY)
			{
				if (unitIndex == 0)
					Spawn_Kaukas_hL_L(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitIndex == 1)
					Spawn_Kaukas_hL_Banner(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			}
			else if (unitClass == CLASS_HEAVY_KINETIC)
			{
				if (unitIndex == 0)
					Spawn_Ural_hC_MG(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 1)
					Spawn_Ural_hC_R(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 2)
					Spawn_Ural_hC_R_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 3)
					Spawn_Ural_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
			}
			else if (unitClass == CLASS_HEAVY_ENERGY)
			{
				if (unitIndex == 0)
					Spawn_Ural_hL_L(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 1)
					Spawn_Ural_hL_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
			}
			else if (unitClass == CLASS_ART)
			{
				if (unitIndex == 0)
				{
					if (owner.GetRace() == raceED)
						Spawn_Kaukas_Art(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
					else // other factions dont have ammo for mobile art
						Spawn_Kaukas_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				}
				else if (unitIndex == 1)
				{
					if (owner.GetRace() == raceED)
						Spawn_Ural_Art(owner, unitNumber, x, y, z, SHIELD_LARGE);
					else // other factions dont have ammo for mobile art
						Spawn_Ural_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				}
			}
			else // hero
			{
				if (unitIndex == 0)
					Spawn_Hero_Grizzly_hP(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 1)
					Spawn_Hero_UFO(owner, unitNumber, x, y, z, SHIELD_LARGE);
			}
		}
		else if (faction == raceUCS)
		{
			if (unitClass == CLASS_LIGHT_KINETIC)
			{
				if (unitIndex == 0)
					Spawn_Tiger_MG(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 1)
					Spawn_Tiger_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 2)
					Spawn_Tiger_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 3)
				{
					if (owner.GetRace() == raceUCS)
						Spawn_Tiger_G(owner, unitNumber, x, y, z, SHIELD_SMALL);
					else // other factions dont have ammo for mobile art
						Spawn_Tiger_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				}
				else if (unitIndex == 4)
					Spawn_Spider_MG(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 5)
					Spawn_Spider_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 6)
					Spawn_Spider_hR(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 7)
					Spawn_Salamander_MG(owner, unitNumber, x, y, z, SHIELD_NONE);
				else if (unitIndex == 8)
					Spawn_Salamander_R(owner, unitNumber, x, y, z, SHIELD_NONE);
				else if (unitIndex == 9)
					Spawn_Salamander_hR(owner, unitNumber, x, y, z, SHIELD_NONE);
			}
			else if (unitClass == CLASS_LIGHT_ENERGY)
			{
				if (unitIndex == 0)
					Spawn_Tiger_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 1)
					Spawn_Spider_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitIndex == 2)
					Spawn_Salamander_P(owner, unitNumber, x, y, z, SHIELD_NONE);
			}
			else if (unitClass == CLASS_MEDIUM_KINETIC)
			{
				if (unitIndex == 0)
					Spawn_Panther_R_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitIndex == 1)
					Spawn_Panther_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitIndex == 2)
					Spawn_Panther_hC_MG(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitIndex == 3)
					Spawn_Panther_hC_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitIndex == 4)
					Spawn_Panther_hC_Banner(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			}
			else if (unitClass == CLASS_MEDIUM_ENERGY)
			{
				if (unitIndex == 0)
					Spawn_Panther_hP(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitIndex == 1)
					Spawn_Panther_hP_P(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitIndex == 2)
					Spawn_Panther_hP_Banner(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			}
			else if (unitClass == CLASS_HEAVY_KINETIC)
			{
				if (unitIndex == 0)
					Spawn_Jaguar_hC_MG(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 1)
					Spawn_Jaguar_hC_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 2)
					Spawn_Jaguar_hC_hR_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 3)
					Spawn_Jaguar_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 4)
					Spawn_Jaguar_R_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
			}
			else if (unitClass == CLASS_HEAVY_ENERGY)
			{
				if (unitIndex == 0)
					Spawn_Jaguar_hP_P(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 1)
					Spawn_Jaguar_hP_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
			}
			else if (unitClass == CLASS_ART)
			{
				if (unitIndex == 0)
				{
					if (owner.GetRace() == raceUCS)
						Spawn_Panther_hG(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
					else // other factions dont have ammo for mobile art
						Spawn_Panther_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				}
				else if (unitIndex == 1)
				{
					if (owner.GetRace() == raceUCS)
						Spawn_Jaguar_hG_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
					else // other factions dont have ammo for mobile art
						Spawn_Jaguar_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				}
				else if (unitIndex == 2)
				{
					if (owner.GetRace() == raceUCS)
						Spawn_Jaguar_hG_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
					else // other factions dont have ammo for mobile art
						Spawn_Jaguar_hC_hR_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
				}
			}
			else // hero
			{
				if (unitIndex == 0)
					Spawn_Hero_Grizzly_hP(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 1)
					Spawn_Hero_UFO(owner, unitNumber, x, y, z, SHIELD_LARGE);
			}
		}
		else if (faction == 4/*MadMaxes*/)
		{
			if (unitClass == CLASS_HERO)
			{
				if (unitIndex == 0)
					Spawn_Hero_Grizzly_hP(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 1)
					Spawn_Hero_UFO(owner, unitNumber, x, y, z, SHIELD_LARGE);
			}
			else
			{
				if (unitIndex == 0)
					Spawn_MadMaxTank_hC(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 1)
					Spawn_MadMaxTank_hC_Alt(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 2)
					Spawn_MadMaxTank_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 3)
					Spawn_MadMaxAltTank_hC(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 4)
					Spawn_MadMaxAltTank_hC_Alt(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitIndex == 5)
					Spawn_MadMaxAltTank_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
			}
		}
	}

	function int SpawnUnit(player owner, int unitNumber, int x, int y, int z)
	{
		int unitClass;
		int faction;
		
		if (comboUnitComposition == UNIT_COMP_RANDOM || comboUnitComposition == UNIT_COMP_X_FACTION_RANDOM)
		{
			unitClass = GetRandomClass(owner);
			SpawnRandomizedUnit(owner, unitNumber, x, y, z, owner.GetScriptData(DATA_UNIT_FACTION), unitClass, GetRandomUnitIndex(owner, owner.GetScriptData(DATA_UNIT_FACTION), unitClass));
			return;
		}
		if (comboUnitComposition == UNIT_COMP_UNIFORM || comboUnitComposition == UNIT_COMP_X_FACTION_UNIFORM)
		{
			SpawnRandomizedUnit(owner, unitNumber, x, y, z, owner.GetScriptData(DATA_UNIT_FACTION), owner.GetScriptData(DATA_UNIT_CLASS), owner.GetScriptData(DATA_UNIT_INDEX));
			return;
		}
		if (comboUnitComposition == UNIT_COMP_MIXED_FACTION_RANDOM)
		{
			unitClass = GetRandomClass(owner);
			if (unitClass == CLASS_MEDIUM_KINETIC)
				faction = 1 + Rand(4);
			else
				faction = 1 + Rand(3);
			SpawnRandomizedUnit(owner, unitNumber, x, y, z, faction, unitClass, GetRandomUnitIndex(owner, faction, unitClass));
			return;
		}
		
		if (owner.GetScriptData(DATA_UNIT_FACTION) == raceLC)
		{
			if (CurrentTechLevel == TECH_LEVEL_LOW || CurrentTechLevel == TECH_LEVEL_MIXED && unitNumber % 3 == 1)
			{
				if (unitNumber == 0)
					Spawn_NewHope_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 1)
					Spawn_Moon_E(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 2)
					Spawn_Moon_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 3)
					Spawn_Moon_E(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 4)
					Spawn_Moon_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 5)
					Spawn_Moon_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 6)
					Spawn_Moon_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 7)
					Spawn_NewHope_MG(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 8)
					Spawn_NewHope_MG(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 9)
					Spawn_NewHope_Banner(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 10)
					Spawn_NewHope_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 11)
					Spawn_NewHope_MG(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 12)
					Spawn_NewHope_MG(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 13)
					Spawn_Moon_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 14)
					Spawn_Moon_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 15)
					Spawn_Moon_E(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 16)
					Spawn_Moon_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 17)
					Spawn_NewHope_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 18)
					Spawn_NewHope_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 19)
					Spawn_NewHope_Banner(owner, unitNumber, x, y, z, SHIELD_SMALL);
			}
			else if (CurrentTechLevel == TECH_LEVEL_MEDIUM || CurrentTechLevel == TECH_LEVEL_MIXED && unitNumber % 3 == 2)
			{
				if (unitNumber == 0)
					Spawn_Crater_He_E(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 1)
					Spawn_Crater_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 2)
					Spawn_Crater_He_E(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 3)
					Spawn_Crater_He_P(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 4)
					Spawn_Crater_He_P(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 5)
					Spawn_Crater_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 6)
					Spawn_Crater_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 7)
					Spawn_Crater_He_Banner(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 8)
					Spawn_Crater_He_E(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 9)
					Spawn_Crater_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 10)
					Spawn_Crater_He_E(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 11)
					Spawn_Crater_He_P(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 12)
					Spawn_Crater_He_P(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 13)
					Spawn_Crater_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 14)
					Spawn_Crater_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 15)
					Spawn_Crater_He_Banner(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 16)
					Spawn_Crater_He_E(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 17)
					Spawn_Crater_He_E(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 18)
					Spawn_Crater_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 19)
					Spawn_Crater_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			}
			else if (CurrentTechLevel == TECH_LEVEL_HIGH || CurrentTechLevel == TECH_LEVEL_MIXED && unitNumber % 3 == 0)
			{
				if (unitNumber == 0)
					Spawn_Crusher_He_P(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 1)
					Spawn_Crusher_He_P(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 2)
					Spawn_Crusher_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 3)
					Spawn_Crusher_He_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 4)
					Spawn_Crusher_He_P(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 5)
					Spawn_Crusher_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 6)
					Spawn_Crusher_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 7)
					Spawn_Crusher_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 8)
					Spawn_Crusher_He_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 9)
					Spawn_Crion_Art(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 10)
					Spawn_Crusher_He_P(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 11)
					Spawn_Crion_Art(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 12)
					Spawn_Crusher_He_P(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 13)
					Spawn_Crusher_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 14)
					Spawn_Crion_Art(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 15)
					Spawn_Crusher_He_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 16)
					Spawn_Crusher_He_P(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 17)
					Spawn_Crusher_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 18)
					Spawn_Crusher_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 19)
					Spawn_Crion_Art(owner, unitNumber, x, y, z, SHIELD_LARGE);
			}
		}
		else if (owner.GetScriptData(DATA_UNIT_FACTION) == raceED)
		{
			if (CurrentTechLevel == TECH_LEVEL_LOW || CurrentTechLevel == TECH_LEVEL_MIXED && unitNumber % 3 == 1)
			{
				if (unitNumber == 0)
					Spawn_Siberia_L(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 1)
					Spawn_Siberia_L(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 2)
					Spawn_Pamir_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 3)
					Spawn_Taiga_L(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 4)
					Spawn_Pamir_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 5)
					Spawn_Siberia_L(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 6)
					Spawn_Siberia_L(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 7)
					Spawn_Pamir_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 8)
					Spawn_Pamir_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 9)
					Spawn_Siberia_Banner(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 10)
					Spawn_Siberia_L(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 11)
					Spawn_Pamir_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 12)
					Spawn_Pamir_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 13)
					Spawn_Pamir_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 14)
					Spawn_Pamir_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 15)
					Spawn_Taiga_L(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 16)
					Spawn_Taiga_L(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 17)
					Spawn_Pamir_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 18)
					Spawn_Pamir_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 19)
					Spawn_Siberia_Banner(owner, unitNumber, x, y, z, SHIELD_SMALL);
			}
			else if (CurrentTechLevel == TECH_LEVEL_MEDIUM || CurrentTechLevel == TECH_LEVEL_MIXED && unitNumber % 3 == 2)
			{
				if (unitNumber == 0)
					Spawn_Kaukas_hL_L(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 1)
					Spawn_Kaukas_hC_R(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 2)
					Spawn_Kaukas_hL_L(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 3)
					Spawn_Kaukas_hC_MG(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 4)
					Spawn_Kaukas_hC_MG(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 5)
					Spawn_Kaukas_hC_R(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 6)
					Spawn_Kaukas_hC_R(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 7)
					Spawn_Kaukas_hL_Banner(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 8)
					Spawn_Kaukas_hL_L(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 9)
					Spawn_Kaukas_hC_R(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 10)
					Spawn_Kaukas_hL_L(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 11)
					Spawn_Kaukas_hC_MG(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 12)
					Spawn_Kaukas_hC_MG(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 13)
					Spawn_Kaukas_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 14)
					Spawn_Kaukas_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 15)
					Spawn_Kaukas_hL_Banner(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 16)
					Spawn_Kaukas_hL_L(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 17)
					Spawn_Kaukas_hL_L(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 18)
					Spawn_Kaukas_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 19)
					Spawn_Kaukas_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			}
			else if (CurrentTechLevel == TECH_LEVEL_HIGH || CurrentTechLevel == TECH_LEVEL_MIXED && unitNumber % 3 == 0)
			{
				if (unitNumber == 0)
					Spawn_Ural_hL_L(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 1)
					Spawn_Ural_hC_R(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 2)
					Spawn_Ural_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 3)
					Spawn_Ural_hL_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 4)
					Spawn_Ural_hL_L(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 5)
					Spawn_Ural_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 6)
					Spawn_Ural_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 7)
					Spawn_Ural_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 8)
					Spawn_Ural_hL_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 9)
				{
					if (owner.GetRace() == raceED)
						Spawn_Ural_Art(owner, unitNumber, x, y, z, SHIELD_LARGE);
					else // other factions dont have ammo for mobile art
						Spawn_Ural_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				}
				else if (unitNumber == 10)
					Spawn_Ural_hC_R(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 11)
				{
					if (owner.GetRace() == raceED)
						Spawn_Ural_Art(owner, unitNumber, x, y, z, SHIELD_LARGE);
					else // other factions dont have ammo for mobile art
						Spawn_Ural_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				}
				else if (unitNumber == 12)
					Spawn_Ural_hL_L(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 13)
					Spawn_Ural_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 14)
				{
					if (owner.GetRace() == raceED)
						Spawn_Ural_Art(owner, unitNumber, x, y, z, SHIELD_LARGE);
					else // other factions dont have ammo for mobile art
						Spawn_Ural_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				}
				else if (unitNumber == 15)
					Spawn_Ural_hL_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 16)
					Spawn_Ural_hC_R(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 17)
					Spawn_Ural_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 18)
					Spawn_Ural_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 19)
				{
					if (owner.GetRace() == raceED)
						Spawn_Ural_Art(owner, unitNumber, x, y, z, SHIELD_LARGE);
					else // other factions dont have ammo for mobile art
						Spawn_Ural_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				}
			}
		}
		else if (owner.GetScriptData(DATA_UNIT_FACTION) == raceUCS)
		{
			if (CurrentTechLevel == TECH_LEVEL_LOW || CurrentTechLevel == TECH_LEVEL_MIXED && unitNumber % 3 == 1)
			{
				if (unitNumber == 0)
					Spawn_Spider_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 1)
					Spawn_Spider_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 2)
					Spawn_Tiger_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 3)
					Spawn_Tiger_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 4)
					Spawn_Tiger_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 5)
					Spawn_Spider_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 6)
					Spawn_Spider_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 7)
					Spawn_Tiger_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 8)
					Spawn_Tiger_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 9)
					Spawn_Spider_Banner(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 10)
					Spawn_Spider_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 11)
					Spawn_Tiger_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 12)
					Spawn_Tiger_C(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 13)
					Spawn_Tiger_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 14)
					Spawn_Tiger_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 15)
					Spawn_Tiger_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 16)
					Spawn_Tiger_P(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 17)
					Spawn_Tiger_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 18)
					Spawn_Tiger_R(owner, unitNumber, x, y, z, SHIELD_SMALL);
				else if (unitNumber == 19)
					Spawn_Spider_Banner(owner, unitNumber, x, y, z, SHIELD_SMALL);
			}
			else if (CurrentTechLevel == TECH_LEVEL_MEDIUM || CurrentTechLevel == TECH_LEVEL_MIXED && unitNumber % 3 == 2)
			{
				if (unitNumber == 0)
					Spawn_Panther_hP_P(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 1)
					Spawn_Panther_hC_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 2)
					Spawn_Panther_hP_P(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 3)
					Spawn_Panther_hC_MG(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 4)
					Spawn_Panther_hC_MG(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 5)
					Spawn_Panther_hC_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 6)
					Spawn_Panther_hC_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 7)
					Spawn_Panther_hP_Banner(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 8)
					Spawn_Panther_hP_P(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 9)
					Spawn_Panther_hC_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 10)
					Spawn_Panther_hP_P(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 11)
					Spawn_Panther_hC_MG(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 12)
					Spawn_Panther_hC_MG(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 13)
					Spawn_Panther_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 14)
					Spawn_Panther_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 15)
					Spawn_Panther_hP_Banner(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 16)
					Spawn_Panther_hP_P(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 17)
					Spawn_Panther_hP_P(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 18)
					Spawn_Panther_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
				else if (unitNumber == 19)
					Spawn_Panther_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			}
			else if (CurrentTechLevel == TECH_LEVEL_HIGH || CurrentTechLevel == TECH_LEVEL_MIXED && unitNumber % 3 == 0)
			{
				if (unitNumber == 0)
					Spawn_Jaguar_hP_P(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 1)
					Spawn_Jaguar_hP_P(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 2)
					Spawn_Jaguar_hC_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 3)
					Spawn_Jaguar_hP_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 4)
					Spawn_Jaguar_hP_P(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 5)
					Spawn_Jaguar_R_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 6)
					Spawn_Jaguar_hC_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 7)
					Spawn_Jaguar_R_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 8)
					Spawn_Jaguar_hP_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 9)
				{
					if (owner.GetRace() == raceUCS)
						Spawn_Jaguar_hG_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
					else // other factions dont have ammo for mobile art
						Spawn_Jaguar_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				}
				else if (unitNumber == 10)
					Spawn_Jaguar_hP_P(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 11)
				{
					if (owner.GetRace() == raceUCS)
						Spawn_Jaguar_hG_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
					else // other factions dont have ammo for mobile art
						Spawn_Jaguar_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				}
				else if (unitNumber == 12)
					Spawn_Jaguar_hP_P(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 13)
					Spawn_Jaguar_hC_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 14)
				{
					if (owner.GetRace() == raceUCS)
						Spawn_Jaguar_hG_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
					else // other factions dont have ammo for mobile art
						Spawn_Jaguar_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				}
				else if (unitNumber == 15)
					Spawn_Jaguar_hP_Banner(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 16)
					Spawn_Jaguar_hP_P(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 17)
					Spawn_Jaguar_R_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 18)
					Spawn_Jaguar_hC_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				else if (unitNumber == 19)
				{
					if (owner.GetRace() == raceUCS)
						Spawn_Jaguar_hG_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
					else // other factions dont have ammo for mobile art
						Spawn_Jaguar_hR(owner, unitNumber, x, y, z, SHIELD_LARGE);
				}
			}
		}
		else if (owner.GetScriptData(DATA_UNIT_FACTION) == 4/*MadMaxes*/)
		{
			if (unitNumber == 0)
				Spawn_MadMaxTank_hC(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 1)
				Spawn_MadMaxTank_hC_Alt(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 2)
				Spawn_MadMaxTank_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 3)
				Spawn_MadMaxAltTank_hC(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 4)
				Spawn_MadMaxAltTank_hC_Alt(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 5)
				Spawn_MadMaxAltTank_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			if (unitNumber == 6)
				Spawn_MadMaxTank_hC(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 7)
				Spawn_MadMaxTank_hC_Alt(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 8)
				Spawn_MadMaxTank_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 9)
				Spawn_MadMaxAltTank_hC(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 10)
				Spawn_MadMaxAltTank_hC_Alt(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 11)
				Spawn_MadMaxAltTank_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			if (unitNumber == 12)
				Spawn_MadMaxTank_hC(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 13)
				Spawn_MadMaxTank_hC_Alt(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 14)
				Spawn_MadMaxTank_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 15)
				Spawn_MadMaxAltTank_hC(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 16)
				Spawn_MadMaxAltTank_hC_Alt(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 17)
				Spawn_MadMaxAltTank_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 18)
				Spawn_MadMaxAltTank_hC_Alt(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
			else if (unitNumber == 19)
				Spawn_MadMaxAltTank_hR(owner, unitNumber, x, y, z, SHIELD_MEDIUM);
		}
	}
	
	function int RandomizeSpawns()
	{
		int i;
		int j;
		int playerCount;
		int index;
		player rPlayer;
		player rPlayer2;
		
		for(i = 0; i < 15; ++i)
		{
			rPlayer=GetPlayer(i);
			if (rPlayer != null)
			{
				rPlayer.SetScriptData(DATA_SPAWN_ASSIGNED, 0);
				playerCount = playerCount + 1;
			}
		}
		
		
		for(i = 0; i < 15; ++i)
		{
			rPlayer=GetPlayer(i);
			if (rPlayer != null)
			{
				index = Rand(playerCount);
				
				for(j = 0; j < 15; ++j)
				{
					rPlayer2=GetPlayer(j);
					if (rPlayer2 != null && rPlayer2.GetScriptData(DATA_SPAWN_ASSIGNED) == 0)
					{
						if (index == 0)
						{
							rPlayer.SetScriptData(DATA_SPAWN_INDEX, j);
							rPlayer2.SetScriptData(DATA_SPAWN_ASSIGNED, 1);
							break;
						}
						index = index - 1;
					}
				}
				playerCount = playerCount - 1;
			}
		}
	}
	
	function int CalculateCenter(player other)
	{
		int i;
		int sumX;
		int sumY;
		int aliveUnits;
		unitex unit;
		
		for (i = 0; i < NumberOfUnits; ++i)
		{
			unit = other.GetScriptUnit(i);
			if (unit != null)
			{
				aliveUnits = aliveUnits + 1;
				sumX = sumX + unit.GetLocationX();
				sumY = sumY + unit.GetLocationY();
			}
		}
		if (aliveUnits > 0)
		{
			other.SetScriptData(DATA_CENTER_X, sumX / aliveUnits);
			other.SetScriptData(DATA_CENTER_Y, sumY / aliveUnits);
		}
		else
		{
			other.SetScriptData(DATA_CENTER_X, 0);
			other.SetScriptData(DATA_CENTER_Y, 0);
		}
	}

	function int Respawn(player owner)
	{
		int i;
		int spawnX;
		int spawnY;
		unitex unit;
		int spawnIndex;
		player spawnPlayer;
		
		CalculateCenter(owner);
		if (owner.GetScriptData(DATA_CENTER_X) != 0 && owner.GetScriptData(DATA_CENTER_Y) != 0)
		{
			//respawn at the center of remaining units
			spawnX = owner.GetScriptData(DATA_CENTER_X);
			spawnY = owner.GetScriptData(DATA_CENTER_Y);
		}
		else
		{
			spawnIndex = owner.GetScriptData(DATA_SPAWN_INDEX);
			spawnPlayer = GetPlayer(spawnIndex);
			spawnX = spawnPlayer.GetStartingPointX();
			spawnY = spawnPlayer.GetStartingPointY();
			//reset view
			owner.LookAt(spawnX,spawnY,-1,-1,-1,0);
		}
		
		for (i = 0; i < NumberOfUnits; ++i)
		{
			unit = owner.GetScriptUnit(i);
			if (unit != null)
			{
				unit.RegenerateHP();
				unit.RegenerateAmmo();
				unit.RegenerateShield();
				unit.RegenerateElectronics();
				unit.RegenerateTemperature();
			}
			else
			{
				SpawnUnit(owner, i, spawnX, spawnY, 0);
			}
		}
	}
	
	function int ControlAI()
	{
		int i;
		int j;
		player rPlayer;
		player otherPlayer;
		player closestPlayer;
		int closestDist;
		int dist;
		int selfX;
		int selfY;
		int otherX;
		int otherY;
		unitex unit;
		
		for(i = 0; i < 15; ++i)
		{
			rPlayer=GetPlayer(i);
			
			if (rPlayer != null)
				CalculateCenter(rPlayer);
		}
		for(i = 0; i < 15; ++i)
		{
			rPlayer=GetPlayer(i);
			
			if (rPlayer != null && rPlayer.GetMaxAttackFrequency() != 200) //HACK: is AI
			{
				selfX = rPlayer.GetScriptData(DATA_CENTER_X);
				selfY = rPlayer.GetScriptData(DATA_CENTER_Y);
				
				if (selfX != 0 && selfY != 0)
				{
					closestPlayer = null;
					
					for (j = 0; j < 15; ++j)
					{
						otherPlayer = GetPlayer(j);
						if (otherPlayer != null && i != j)
						{
							otherX = otherPlayer.GetScriptData(DATA_CENTER_X);
							otherY = otherPlayer.GetScriptData(DATA_CENTER_Y);
							if (otherX != 0 && otherY != 0)
							{
								dist = Distance(selfX, selfY, otherX, otherY);
								if (closestPlayer == null || dist < closestDist)
								{
									closestPlayer = otherPlayer;
									closestDist = dist;
								}
							}
						}
					}
					
					if (closestPlayer != null)
					{
						otherX = closestPlayer.GetScriptData(DATA_CENTER_X);
						otherY = closestPlayer.GetScriptData(DATA_CENTER_Y);
						
						for (j = 0; j < NumberOfUnits; ++j)
						{
							unit = rPlayer.GetScriptUnit(j);
							if (unit != null)
							{
								if (closestDist < 10)
								{
									if (unit.GetObjectRecyclePercent() == 1 || Distance(selfX, selfY, unit.GetLocationX(), unit.GetLocationY()) > 8)
										unit.CommandMove(selfX, selfY, 0);
								}
								else
								{
									unit.CommandMove((selfX + otherX * 2) / 3, (selfY + otherY * 2) / 3, 0);
								}
							}
						}
					}
				}
			}
		}
	}
	
	function int UpdateConsole()
	{
		int time;
		player leader;

		time=RoundTimer/20;
		
		if (time % 12 < 3 && !ArmageddonInProgress)
		{
			if (NumberOfRounds > 0)
				SetConsoleText("<0xffffffff>Round <%0> / <%1> - <%2>:<%3><%4>. <%5> players left.", RoundNumber, NumberOfRounds, time/60, (time%60)/10, time%10, RoundPlayersLeft);
			else
				SetConsoleText("<0xffffffff>Round <%0> - <%1>:<%2><%3>. <%4> players left.", RoundNumber, time/60, (time%60)/10, time%10, RoundPlayersLeft);
		}
		else if (time % 12 < 3 && ArmageddonInProgress)
		{
			if (NumberOfRounds > 0)
				SetConsoleText("<0xffffffff>Round <%0> / <%1> - <%2>:<%3><%4>. <%5> players left. <L10><0xff0000ff>A R M A G E D D O N ! ! !", RoundNumber, NumberOfRounds, time/60, (time%60)/10, time%10, RoundPlayersLeft);
			else
				SetConsoleText("<0xffffffff>Round <%0> - <%1>:<%2><%3>. <%4> players left. <L10><0xff0000ff>A R M A G E D D O N ! ! !", RoundNumber, time/60, (time%60)/10, time%10, RoundPlayersLeft);
		}
		else if (time % 12 < 6 && BestRoundPlayer != -1)
		{
			leader = GetPlayer(BestRoundPlayer);
			if (NumberOfRounds > 0)
			{
				if (leader.GetSideColor() == 0)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff3cffff><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 1)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff3d42ff><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 2)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff4bff3c><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 3)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xffff433c><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 4)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff3c9eff><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 5)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xffffff5d><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 6)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff5f1be5><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 7)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xffff3cef><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 8)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xffffffff><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 9)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xffaaaaaa><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 10)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff585858><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 11)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff2faeb0><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 12)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff9ee7ff><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 13)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xffd0ffe0><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 14)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xffffe4ff><%2><0xffffffff> leads the round with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestRoundScore);
			}
			else
			{
				if (leader.GetSideColor() == 0)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff3cffff><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 1)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff3d42ff><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 2)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff4bff3c><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 3)
					SetConsoleText("<0xffffffff>Round <%0> - <0xffff433c><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 4)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff3c9eff><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 5)
					SetConsoleText("<0xffffffff>Round <%0> - <0xffffff5d><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 6)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff5f1be5><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 7)
					SetConsoleText("<0xffffffff>Round <%0> - <0xffff3cef><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 8)
					SetConsoleText("<0xffffffff>Round <%0> - <0xffffffff><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 9)
					SetConsoleText("<0xffffffff>Round <%0> - <0xffaaaaaa><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 10)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff585858><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 11)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff2faeb0><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 12)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff9ee7ff><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 13)
					SetConsoleText("<0xffffffff>Round <%0> - <0xffd0ffe0><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
				else if (leader.GetSideColor() == 14)
					SetConsoleText("<0xffffffff>Round <%0> - <0xffffe4ff><%1><0xffffffff> leads the round with <%2> kills", RoundNumber, leader.GetName(), BestRoundScore);
			}
		}
		else if (time % 12 < 9 && BestPrevRoundPlayer != -1)
		{
			leader = GetPlayer(BestPrevRoundPlayer);
			if (NumberOfRounds > 0)
			{
				if (leader.GetSideColor() == 0)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xff3cffff><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 1)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xff3d42ff><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 2)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xff4bff3c><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 3)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xffff433c><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 4)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xff3c9eff><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 5)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xffffff5d><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 6)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xff5f1be5><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 7)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xffff3cef><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 8)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xffffffff><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 9)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xffaaaaaa><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 10)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xff585858><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 11)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xff2faeb0><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 12)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xff9ee7ff><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 13)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xffd0ffe0><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 14)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - previous round won by <0xffffe4ff><%2><0xffffffff> with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestPrevRoundScore);
			}
			else
			{
				if (leader.GetSideColor() == 0)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xff3cffff><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 1)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xff3d42ff><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 2)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xff4bff3c><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 3)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xffff433c><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 4)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xff3c9eff><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 5)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xffffff5d><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 6)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xff5f1be5><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 7)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xffff3cef><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 8)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xffffffff><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 9)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xffaaaaaa><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 10)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xff585858><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 11)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xff2faeb0><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 12)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xff9ee7ff><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 13)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xffd0ffe0><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
				else if (leader.GetSideColor() == 14)
					SetConsoleText("<0xffffffff>Round <%0> - previous round won by <0xffffe4ff><%1><0xffffffff> with <%2> kills", RoundNumber, leader.GetName(), BestPrevRoundScore);
			}
		}
		else if (BestPlayer != -1)
		{
			leader = GetPlayer(BestPlayer);
			if (NumberOfRounds > 0)
			{
				if (leader.GetSideColor() == 0)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff3cffff><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 1)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff3d42ff><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 2)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff4bff3c><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 3)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xffff433c><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 4)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff3c9eff><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 5)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xffffff5d><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 6)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff5f1be5><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 7)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xffff3cef><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 8)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xffffffff><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 9)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xffaaaaaa><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 10)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff585858><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 11)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff2faeb0><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 12)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xff9ee7ff><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 13)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xffd0ffe0><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 14)
					SetConsoleText("<0xffffffff>Round <%0> / <%1> - <0xffffe4ff><%2><0xffffffff> leads the match with <%3> kills", RoundNumber, NumberOfRounds, leader.GetName(), BestScore);
			}
			else
			{
				if (leader.GetSideColor() == 0)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff3cffff><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 1)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff3d42ff><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 2)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff4bff3c><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 3)
					SetConsoleText("<0xffffffff>Round <%0> - <0xffff433c><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 4)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff3c9eff><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 5)
					SetConsoleText("<0xffffffff>Round <%0> - <0xffffff5d><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 6)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff5f1be5><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 7)
					SetConsoleText("<0xffffffff>Round <%0> - <0xffff3cef><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 8)
					SetConsoleText("<0xffffffff>Round <%0> - <0xffffffff><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 9)
					SetConsoleText("<0xffffffff>Round <%0> - <0xffaaaaaa><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 10)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff585858><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 11)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff2faeb0><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 12)
					SetConsoleText("<0xffffffff>Round <%0> - <0xff9ee7ff><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 13)
					SetConsoleText("<0xffffffff>Round <%0> - <0xffd0ffe0><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
				else if (leader.GetSideColor() == 14)
					SetConsoleText("<0xffffffff>Round <%0> - <0xffffe4ff><%1><0xffffffff> leads the match with <%2> kills", RoundNumber, leader.GetName(), BestScore);
			}
		}
	}

	state Initialize;
	state PostInitialize;
	state RoundInitialize;
	state RoundOngoing;
	state RoundEnd;
	state GameEnd;
	
	state Initialize
	{
		player rPlayer;
		int i;
		
		if (comboRoundsNumber == ROUNDS_NUMBER_1) NumberOfRounds = 1;
		else if (comboRoundsNumber == ROUNDS_NUMBER_2) NumberOfRounds = 2;
		else if (comboRoundsNumber == ROUNDS_NUMBER_3) NumberOfRounds = 3;
		else if (comboRoundsNumber == ROUNDS_NUMBER_4) NumberOfRounds = 4;
		else if (comboRoundsNumber == ROUNDS_NUMBER_5) NumberOfRounds = 5;
		else if (comboRoundsNumber == ROUNDS_NUMBER_8) NumberOfRounds = 8;
		else if (comboRoundsNumber == ROUNDS_NUMBER_10) NumberOfRounds = 10;
		else if (comboRoundsNumber == ROUNDS_NUMBER_15) NumberOfRounds = 15;
		else if (comboRoundsNumber == ROUNDS_NUMBER_20) NumberOfRounds = 20;
		else if (comboRoundsNumber == ROUNDS_NUMBER_UNLIMITED) NumberOfRounds = 0;
		
		if (comboRoundTimeLimit == ROUND_TIME_LIMIT_1MIN) RoundTimeLimit = 1 * 60 * 20;
		else if (comboRoundTimeLimit == ROUND_TIME_LIMIT_2MIN) RoundTimeLimit = 2 * 60 * 20;
		else if (comboRoundTimeLimit == ROUND_TIME_LIMIT_3MIN) RoundTimeLimit = 3 * 60 * 20;
		else if (comboRoundTimeLimit == ROUND_TIME_LIMIT_4MIN) RoundTimeLimit = 4 * 60 * 20;
		else if (comboRoundTimeLimit == ROUND_TIME_LIMIT_5MIN) RoundTimeLimit = 5 * 60 * 20;
		else if (comboRoundTimeLimit == ROUND_TIME_LIMIT_UNLIMITED) RoundTimeLimit = 0;
		
		if (comboStartingUnits == STARTING_UNITS_1) NumberOfUnits = 1;
		else if (comboStartingUnits == STARTING_UNITS_2) NumberOfUnits = 2;
		else if (comboStartingUnits == STARTING_UNITS_3) NumberOfUnits = 3;
		else if (comboStartingUnits == STARTING_UNITS_4) NumberOfUnits = 4;
		else if (comboStartingUnits == STARTING_UNITS_5) NumberOfUnits = 5;
		else if (comboStartingUnits == STARTING_UNITS_8) NumberOfUnits = 8;
		else if (comboStartingUnits == STARTING_UNITS_10) NumberOfUnits = 10;
		else if (comboStartingUnits == STARTING_UNITS_15) NumberOfUnits = 15;
		else if (comboStartingUnits == STARTING_UNITS_20) NumberOfUnits = 20;
		else if (comboStartingUnits == STARTING_UNITS_1_KEEP_ALIVE) NumberOfUnits = 1;
		else if (comboStartingUnits == STARTING_UNITS_2_KEEP_ALIVE) NumberOfUnits = 2;
		else if (comboStartingUnits == STARTING_UNITS_3_KEEP_ALIVE) NumberOfUnits = 3;
		else if (comboStartingUnits == STARTING_UNITS_4_KEEP_ALIVE) NumberOfUnits = 4;
		else if (comboStartingUnits == STARTING_UNITS_5_KEEP_ALIVE) NumberOfUnits = 5;
		else if (comboStartingUnits == STARTING_UNITS_8_KEEP_ALIVE) NumberOfUnits = 8;
		else if (comboStartingUnits == STARTING_UNITS_10_KEEP_ALIVE) NumberOfUnits = 10;
		else if (comboStartingUnits == STARTING_UNITS_15_KEEP_ALIVE) NumberOfUnits = 15;
		else if (comboStartingUnits == STARTING_UNITS_20_KEEP_ALIVE) NumberOfUnits = 20;
		
		if (comboStartingUnits < STARTING_UNITS_1_KEEP_ALIVE)
			ResetUnits = true;
		
		for(i=0; i < 15; ++i)
		{
			rPlayer=GetPlayer(i);
			if (rPlayer != null)
			{
				rPlayer.AddResearch("RES_MISSION_PACK1_ONLY");
				rPlayer.SetAllowGiveUnits(false);
				rPlayer.EnableAIFeatures2(ai2BNSendResult,false);
				rPlayer.AddResearch("RES_MCH2");
				rPlayer.AddResearch("RES_MCH3");
				rPlayer.AddResearch("RES_MCH4");
				rPlayer.AddResearch("RES_ED_MSC2");
				rPlayer.AddResearch("RES_ED_MSC3");
				rPlayer.AddResearch("RES_ED_MSC4");
				rPlayer.AddResearch("RES_ED_MHC2");
				rPlayer.AddResearch("RES_ED_MHC3");
				rPlayer.AddResearch("RES_ED_MHC4");
				rPlayer.AddResearch("RES_UCS_MSC2");
				rPlayer.AddResearch("RES_UCS_MSC3");
				rPlayer.AddResearch("RES_UCS_MSC4");
				rPlayer.AddResearch("RES_UCS_MHC2");
				rPlayer.AddResearch("RES_UCS_MHC3");
				rPlayer.AddResearch("RES_UCS_MHC4");
				rPlayer.AddResearch("RES_MSR2");
				rPlayer.AddResearch("RES_MSR3");
				rPlayer.AddResearch("RES_MSR4");
				rPlayer.AddResearch("RES_MMR2");
				rPlayer.AddResearch("RES_MMR3");
				rPlayer.AddResearch("RES_MMR4");
				rPlayer.AddResearch("RES_UCS_MG2");
				rPlayer.AddResearch("RES_UCS_MG3");
				rPlayer.AddResearch("RES_UCS_MG4");
				rPlayer.AddResearch("RES_UCS_SGen");
				rPlayer.AddResearch("RES_UCS_MGen");
				rPlayer.AddResearch("RES_UCS_HGen");
				rPlayer.AddResearch("RES_ED_SGen");
				rPlayer.AddResearch("RES_ED_MGen");
				rPlayer.AddResearch("RES_ED_HGen");
				rPlayer.AddResearch("RES_LC_SGen");
				rPlayer.AddResearch("RES_LC_MGen");
				rPlayer.AddResearch("RES_LC_HGen");

				rPlayer.SetMaxTankPlatoonSize(1);
				rPlayer.SetNumberOfOffensiveTankPlatoons(20);
				rPlayer.SetNumberOfDefensiveTankPlatoons(0);
				rPlayer.SetNumberOfDefensiveShipPlatoons(0);
				rPlayer.SetNumberOfDefensiveHelicopterPlatoons(0);
				rPlayer.EnableAI(false);
				rPlayer.EnableAIFeatures(aiRush,true);
				rPlayer.EnableAIFeatures(aiBuildBuildings,false);
				rPlayer.EnableAIFeatures2(ai2NeutralAI,false);//FFA

				rPlayer.SetMoney(0);
				rPlayer.SetMaxDistance(0);
				rPlayer.EnableBuilding("LCBBF", 0);
				rPlayer.EnableBuilding("LCBMR", 0);
				rPlayer.EnableBuilding("LCBPP", 0);
				rPlayer.EnableBuilding("LCBBA", 0);
				rPlayer.EnableBuilding("LCBAB", 0);
				rPlayer.EnableBuilding("LCBDE", 0);
				rPlayer.EnableBuilding("LCBHQ", 0);
				rPlayer.EnableBuilding("LCBSB", 0);
				rPlayer.EnableBuilding("LCBLZ", 0);
				rPlayer.EnableBuilding("WLASER", 0);
				rPlayer.EnableBuilding("LCLASERWALL", 0);
				rPlayer.EnableBuilding("LCBNE", 0);
				rPlayer.EnableBuilding("LCBUC", 0);
				rPlayer.EnableBuilding("LCBCC", 0);
				rPlayer.EnableBuilding("LCBRC", 0);
				rPlayer.EnableBuilding("LCBSR", 0);
				rPlayer.EnableBuilding("LCBGA", 0);
				rPlayer.EnableBuilding("LCBSD", 0);
				rPlayer.EnableBuilding("LCBWC", 0);
				rPlayer.EnableBuilding("LCBSS", 0);
				rPlayer.EnableBuilding("LCBPP2", 0);
				rPlayer.EnableBuilding("LCBART", 0);
				rPlayer.EnableBuilding("LCBEN1", 0);
				rPlayer.EnableBuilding("LCBEN2", 0);
				rPlayer.SetAllowGiveMoney(false);
				rPlayer.LookAt(rPlayer.GetStartingPointX(),rPlayer.GetStartingPointY(),6,0,20,0);
			}
		}
		
		ShowArea(32767, GetRight() / 2, GetBottom() / 2, 0, 256); //make everybody see everything
		ShowArea(32767, GetRight() / 2, GetBottom() / 2, 1, 256); //make everybody see everything (tunnels)
		
		RoundNumber = 0;
		HeroesImmortal = 0;
		FraggingDisabled = 0;
		BestPlayer = -1;
		BestScore = 0;
		BestRoundPlayer = -1;
		BestRoundScore = 0;
		BestPrevRoundPlayer = -1;
		BestPrevRoundScore = 0;
		
		if (comboWeather == WEATHER_DYNAMIC)
			SetTimer(0, WEATHER_EFFECT_DURATION);
		else if (comboWeather == WEATHER_RAIN)
			Rain(GetRight() / 2, GetBottom() / 2, 127, 100, 100*60*60*20, 100, 5);
		else if (comboWeather == WEATHER_SNOW)
			Snow(GetRight() / 2, GetBottom() / 2, 127, 100, 100*60*60*20, 100, 5);
		else if (comboWeather == WEATHER_RAINSTORM)
			Storm(GetRight() / 2, GetBottom() / 2, 127, 100, 100*60*60*20, 100, 1, 3, 5);
		else if (comboWeather == WEATHER_METEORS)
			MeteorRain(GetRight() / 2, GetBottom() / 2, 127, 100, 100*60*60*20, 100, 1, 3);
		else if (comboWeather == WEATHER_ARMAGEDDON)
			SetTimer(1, 200);
		
		return PostInitialize;
	}
	
	state PostInitialize
	{
		//some AI players are stubborn and keep receiving initial money
		player rPlayer;
		int i;
		
		for(i=0; i < 15; ++i)
		{
			rPlayer=GetPlayer(i);
			if (rPlayer != null)
			{
				rPlayer.SetMoney(0);
			}
		}
		return RoundInitialize, 1;
	}

	state RoundInitialize
	{
		player rPlayer;
		int i;
		int tech;
		
		RoundTimer = 0;
		
		if (ArmageddonInProgress)
		{
			SetConsoleText("<0xffffffff>New round is about to start - waiting for armageddon to cool down");
			ArmageddonInProgress = false;
			return RoundInitialize, 300;
		}
		RoundNumber = RoundNumber + 1;
		
		if (comboTechLevel == TECH_LEVEL_PROGRESSIVE)
		{
			if (NumberOfRounds > 1 && RoundNumber <= NumberOfRounds / 3)
				CurrentTechLevel = TECH_LEVEL_LOW;
			else if (NumberOfRounds > 2 && RoundNumber <= 2 * NumberOfRounds / 3)
				CurrentTechLevel = TECH_LEVEL_MEDIUM;
			else
				CurrentTechLevel = TECH_LEVEL_HIGH;
		}
		else if (comboTechLevel == TECH_LEVEL_RANDOM && comboUnitComposition != UNIT_COMP_UNIFORM && comboUnitComposition != UNIT_COMP_X_FACTION_UNIFORM)
		{
			tech = Rand(4);
			if (tech == 0)
				CurrentTechLevel = TECH_LEVEL_LOW;
			else if (tech == 1)
				CurrentTechLevel = TECH_LEVEL_MEDIUM;
			else if (tech == 2)
				CurrentTechLevel = TECH_LEVEL_HIGH;
			else
				CurrentTechLevel = TECH_LEVEL_MIXED;
		}
		else if (comboTechLevel == TECH_LEVEL_RANDOM && (comboUnitComposition == UNIT_COMP_UNIFORM || comboUnitComposition == UNIT_COMP_X_FACTION_UNIFORM))
		{
			tech = Rand(3);
			if (tech == 0)
				CurrentTechLevel = TECH_LEVEL_LOW;
			else if (tech == 1)
				CurrentTechLevel = TECH_LEVEL_MEDIUM;
			else
				CurrentTechLevel = TECH_LEVEL_HIGH;
		}
		else
			CurrentTechLevel = comboTechLevel;

		RandomizeSpawns();

		for(i=0; i < 15; ++i)
		{
			rPlayer=GetPlayer(i);
			if (rPlayer != null)
			{
				if (CurrentTechLevel == TECH_LEVEL_RANDOM_PER_PLAYER)
				{
					tech = Rand(4);
					if (tech == 0)
						rPlayer.SetScriptData(DATA_UNIT_TECH, TECH_LEVEL_LOW);
					else if (tech == 1)
						rPlayer.SetScriptData(DATA_UNIT_TECH, TECH_LEVEL_MEDIUM);
					else if (tech == 2)
						rPlayer.SetScriptData(DATA_UNIT_TECH, TECH_LEVEL_HIGH);
					else
						rPlayer.SetScriptData(DATA_UNIT_TECH, TECH_LEVEL_MIXED);
				}
				else
					rPlayer.SetScriptData(DATA_UNIT_TECH, CurrentTechLevel);
				
				if (comboUnitComposition == UNIT_COMP_X_FACTION_RANDOM || comboUnitComposition == UNIT_COMP_X_FACTION_UNIFORM || comboUnitComposition == UNIT_COMP_X_FACTION_CONSTANT)
				{
					if (rPlayer.GetScriptData(DATA_UNIT_TECH) == TECH_LEVEL_MEDIUM)
						rPlayer.SetScriptData(DATA_UNIT_FACTION, 1 + Rand(10) / 3); //10% chance for faction "4", which are mad maxes
					else
						rPlayer.SetScriptData(DATA_UNIT_FACTION, 1 + Rand(3));
				}
				else
					rPlayer.SetScriptData(DATA_UNIT_FACTION, rPlayer.GetRace());
				
				if (comboUnitComposition == UNIT_COMP_UNIFORM || comboUnitComposition == UNIT_COMP_X_FACTION_UNIFORM)
				{
					rPlayer.SetScriptData(DATA_UNIT_CLASS, GetRandomClass(rPlayer));
					rPlayer.SetScriptData(DATA_UNIT_INDEX, GetRandomUnitIndex(rPlayer, rPlayer.GetScriptData(DATA_UNIT_FACTION), rPlayer.GetScriptData(DATA_UNIT_CLASS)));
				}
				Respawn(rPlayer);
			}
		}

		return RoundOngoing, 20;
	}

	state RoundOngoing
	{
		player rPlayer;
		int i;
		int j;
		int deadMask;
		int isAlive;
		unitex unit;
		unitex target;
		int heroTimer;
		
		RoundTimer = RoundTimer + 20;
		heroTimer = RoundTimeLimit / 2;
		if (heroTimer == 0)
		{
			heroTimer = 3*60*20;
		}

		if (RoundTimer <= heroTimer)
			HeroesImmortal = 1;
		else
			HeroesImmortal = 0;

		BestPlayer = -1;
		BestScore = 0;
		BestRoundPlayer = -1;
		BestRoundScore = 0;
		RoundPlayersLeft = 0;
		for(i=0; i < 15; ++i)
		{
			rPlayer=GetPlayer(i);
			
			if (rPlayer != null)
			{
				isAlive = false;
				if ((RoundTimer / 20) % 2 == 0)
					rPlayer.SetMoney(rPlayer.GetScriptData(DATA_ROUND_POINTS));
				else
					rPlayer.SetMoney(rPlayer.GetScriptData(DATA_POINTS) + rPlayer.GetScriptData(DATA_ROUND_POINTS));
				
				for (j = 0; j < NumberOfUnits; ++j)
				{
					unit = rPlayer.GetScriptUnit(j);
					if (unit != null)
					{
						// HACK: civil units have this value set to 1 in helper functions above
						if (unit.GetObjectRecyclePercent() != 1)
							isAlive = true; //player needs to have at least one military unit to be "alive"
						// HACK: units that require external ammo have it set to 2
						if (unit.GetObjectRecyclePercent() == 2 && (unit.GetAmmo() < 10 || (RoundTimer / 20) % 30 == 0))
							unit.RegenerateAmmo();
						if (unit.GetObjectRecyclePercent() == 3 && HeroesImmortal)
						{
							if ((RoundTimer / 20) % 3 == 0)
								unit.RegenerateHP();
							else if ((RoundTimer / 20) % 3 == 1)
								unit.RegenerateShield();
							else
							{
								unit.RegenerateElectronics();
								unit.RegenerateTemperature();
							}
						}
						if (unit.GetObjectRecyclePercent() == 4 && HeroesImmortal)
						{
							unit.RegenerateHP();
							unit.RegenerateShield();
							unit.RegenerateElectronics();
							unit.RegenerateTemperature();
						}
					}
				}
				if (isAlive)
					RoundPlayersLeft = RoundPlayersLeft + 1;
				else
					deadMask = deadMask | rPlayer.GetIFF();
				if (BestRoundPlayer == -1 || rPlayer.GetScriptData(DATA_ROUND_POINTS) > BestRoundScore)
				{
					BestRoundPlayer = i;
					BestRoundScore = rPlayer.GetScriptData(DATA_ROUND_POINTS);
				}
				if (BestPlayer == -1 || rPlayer.GetScriptData(DATA_POINTS) + rPlayer.GetScriptData(DATA_ROUND_POINTS) > BestScore)
				{
					BestPlayer = i;
					BestScore = rPlayer.GetScriptData(DATA_POINTS) + rPlayer.GetScriptData(DATA_ROUND_POINTS);
				}
			}
		}
		
		KillArea(deadMask, GetRight() / 2, GetBottom() / 2, 0, 256);
		KillArea(deadMask, GetRight() / 2, GetBottom() / 2, 1, 256);
		ShowArea(deadMask, GetRight() / 2, GetBottom() / 2, 0, 256, showAreaPassives | showAreaBuildings | showAreaUnits); //make watchers see everything

		UpdateConsole();

		ControlAI();
		
		if (RoundPlayersLeft < 2 || RoundTimeLimit != 0 && RoundTimer >= RoundTimeLimit)
			return RoundEnd, 20;
		
		return RoundOngoing, 20;
	}

	state RoundEnd
	{
		player rPlayer;
		int i;
		int score;
		int roundScore;
		int bestScore;
		
		BestPrevRoundScore = BestRoundScore;
		BestPrevRoundPlayer = BestRoundPlayer;
		BestRoundScore = 0;
		BestRoundPlayer = -1;
		
		for(i=0; i < 15; ++i)
		{
			rPlayer=GetPlayer(i);
			if (rPlayer != null)
			{
				score = rPlayer.GetScriptData(DATA_POINTS);
				roundScore = rPlayer.GetScriptData(DATA_ROUND_POINTS);
				score = score + roundScore;
				rPlayer.SetScriptData(DATA_POINTS, score);
				rPlayer.SetScriptData(DATA_ROUND_POINTS, 0);
				rPlayer.SetMoney(0);
			}
		}
		if (ResetUnits == 1)
		{
			FraggingDisabled = 1;
			KillArea(32767, GetRight() / 2, GetBottom() / 2, 0, 256);
			KillArea(32767, GetRight() / 2, GetBottom() / 2, 1, 256);
			FraggingDisabled = 0;
		}
		
		if (RoundNumber == NumberOfRounds)
		{
			for(i = 0; i < 15; ++i)
			{
				rPlayer=GetPlayer(i);
				if(rPlayer!=null) 
				{
					if(rPlayer.GetScriptData(DATA_POINTS) > bestScore)
						bestScore = rPlayer.GetScriptData(DATA_POINTS);
				}
			}
			for(i = 0; i < 15; ++i)
			{
				rPlayer=GetPlayer(i);
				if(rPlayer!=null && rPlayer.IsAlive()) 
				{
					if(rPlayer.GetScriptData(DATA_POINTS) == bestScore)
						rPlayer.Victory();
					else
						rPlayer.Defeat();
				}
			}
			return GameEnd, 20;
		}
		
		return RoundInitialize, 1;
	}
	
	state GameEnd
	{
		return GameEnd;
	}

	event RemoveResources()
	{
		true;
	}

	event RemoveUnits()
	{
		true;
	}
	
	event Timer0()
	{
		int random;
		int rain;
		int snow;
		int rainstorm;
		int meteors;
		int intensity;
		
		random = Rand(100);
		if (GetTerrainType() == terrainTypeWinter)
		{
			if (random < 30)
				snow = true;
			else if (random < 32)
				meteors = true;
		}
		else if (GetTerrainType() == terrainTypeEarlySpring)
		{
			if (random < 15)
				snow = true;
			else if (random < 30)
				rain = true;
			else if (random < 40)
			{
				rain = true;
				snow = true;
			}
			else if (random < 48)
				rainstorm = true;
			else if (random < 50)
				meteors = true;
		}
		else if (GetTerrainType() == terrainTypeSpring || GetTerrainType() == terrainTypeSummer)
		{
			if (random < 30)
				rain = true;
			else if (random < 38)
				rainstorm = true;
			else if (random < 40)
				meteors = true;
		}
		else if (GetTerrainType() == terrainTypeMoon)
		{
			if (random < 20)
				meteors = true;
		}
		else if (GetTerrainType() == terrainTypeDesert) //desert, volcanoes, lava pits, moon
		{
			if (random < 10)
				meteors = true;
		}
		else //volcanoes, lava pits
		{
			if (random < 15)
				meteors = true;
		}
		
		if (rain)
		{
			intensity = Rand(10) + 1;
			Rain(GetRight() / 2, GetBottom() / 2, 127, 100, WEATHER_EFFECT_DURATION, 100, intensity);
		}
		if (snow)
		{
			intensity = Rand(10) + 1;
			Snow(GetRight() / 2, GetBottom() / 2, 127, 100, WEATHER_EFFECT_DURATION, 100, intensity);
		}
		if (rainstorm)
		{
			Storm(16, 16, GetBottom() / 2, 100, WEATHER_EFFECT_DURATION, 100, 1, 3, 5);
			Storm(16, GetBottom() / 2, GetBottom() - 16, 100, WEATHER_EFFECT_DURATION, 100, 1, 3, 5);
			Storm(GetRight() - 16, 16, GetBottom() / 2, 100, WEATHER_EFFECT_DURATION, 100, 1, 3, 5);
			Storm(GetRight() - 16, GetBottom() - 16, GetBottom() / 2, 100, WEATHER_EFFECT_DURATION, 100, 1, 3, 5);
		}
		if (meteors)
		{
			MeteorRain(16, 16, GetBottom() / 2, 1, WEATHER_EFFECT_DURATION, 1, 1, 3);
			MeteorRain(16, GetBottom() - 16, GetBottom() / 2, 1, WEATHER_EFFECT_DURATION, 1, 1, 3);
			MeteorRain(GetRight() - 16, 16, GetBottom() / 2, 1, WEATHER_EFFECT_DURATION, 1, 1, 3);
			MeteorRain(GetRight() - 16, GetBottom() - 16, GetBottom() / 2, 1, WEATHER_EFFECT_DURATION, 1, 1, 3);
		}
	}
	
	event Timer1()
	{
		int armageddonStart;
		int armageddonDuration;
		int strength;
		
		armageddonStart = RoundTimeLimit / 2;
		if (armageddonStart == 0)
			armageddonStart = 3 * 60 * 20;
		armageddonDuration = armageddonStart;
		
		if (RoundTimer > armageddonStart)
		{
			ArmageddonInProgress = true;
			strength = 10 * (RoundTimer - armageddonStart) / armageddonDuration;
			if (strength > 10)
				strength = 10;
			
			MeteorRain(16, 16, GetBottom() / 2, 1, 200, 1, 1, strength);
			MeteorRain(16, GetBottom() - 16, GetBottom() / 2, 1, 200, 1, 1, strength);
			MeteorRain(GetRight() - 16, 16, GetBottom() / 2, 1, 200, 1, 1, strength);
			MeteorRain(GetRight() - 16, GetBottom() - 16, GetBottom() / 2, 1, 200, 1, 1, strength);
		}
	}

	event UnitDestroyed(unit uUnit)
	{
		unit uAttacker;
		player pAttacker;
		int points;
		
		if (FraggingDisabled)
			return true;
		
		uAttacker = uUnit.GetAttacker();
		if(uAttacker == null) return false;
		pAttacker = GetPlayer(uAttacker.GetIFFNumber());
		points = pAttacker.GetScriptData(DATA_ROUND_POINTS);
		if(uAttacker.GetIFFNumber() == uUnit.GetIFFNumber())
		{
			points = points - FRAG_REWARD;
		}
		else
		{
			points = points + FRAG_REWARD;
		}
		pAttacker.SetScriptData(DATA_ROUND_POINTS, points);

		return true;
	}

	command Initialize()
	{
		comboRoundsNumber = ROUNDS_NUMBER_5;
		comboRoundTimeLimit = ROUND_TIME_LIMIT_3MIN;
		comboStartingUnits = STARTING_UNITS_5;
		comboTechLevel = TECH_LEVEL_PROGRESSIVE;
		comboUnitComposition = UNIT_COMP_RANDOM;
		comboWeather = WEATHER_OFF;
	}

	command Uninitialize()
	{
		ResourcesPerContainer(8);
	}

	command Combo1(int nMode) button comboRoundsNumber
	{
		comboRoundsNumber = nMode;
	}

	command Combo2(int nMode) button comboRoundTimeLimit
	{
		comboRoundTimeLimit = nMode;
	}
	
	command Combo3(int nMode) button comboStartingUnits 
	{
		comboStartingUnits = nMode;
	}
	
	command Combo4(int nMode) button comboTechLevel 
	{
		comboTechLevel = nMode;
	}
	
	command Combo5(int nMode) button comboUnitComposition 
	{
		comboUnitComposition = nMode;
	}
	
	command Combo6(int nMode) button comboWeather 
	{
		comboWeather = nMode;
	}
}
