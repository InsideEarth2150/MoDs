# IEO Arena
*by Guardian and Szakael*

This mod offers a completely rebuilt version of the arena mode. Unlike the original one, it enables dynamic, heavily configurable and very fun battles of up to 20 units per player. 

**Installation**
- place the .wd file in you game's WD files directory (`/WDFiles`, or you can use any custom directory, such as `/CustomWDFiles` etc)
- the mod is multiplayer neutral and will not cause desyncs

**Key features**
- game is split into multiple rounds
- players earn points for killing enemy units
- a few new maps for arena mode
- dynamic weather, including armageddon mode
- play with units from different factions in one game
- various tech level and unit composition options - you can customize setup to have all units of one kind, all units exactly the same, mixed different tier units and much more
- Grizzly and UFO hero units which are rare, but almost immortal for the first half of the round
- AI is a bit smarter than normally
## Settings
✅ **Rounds Number**
(1 - unlimited) - Number of rounds before the game ends. Unlimited game will never end

✅ **Round time limit**
(1 min - unlimited) - Time limit for each round. The round ends when all but one players are eliminated or when round time ends.

✅ **Starting units**
(1-20) - number of units each player receives at the start of each round. Each option has a "keep alive" variant, which prevents resetting all units at round end

✅ **Tech level**
- LOW - all players will receive light units only
- MEDIUM - all players will receive medium units only
- HIGH - all players will receive heavy units only
- PROGRESSIVE - tech level will be "low" for the first 1/3rd of rounds, then it will switch to "medium" for next 1/3rd and the final 1/3rd will be on "high"
- MIXED - units will be from all (low/medium/high) tech levels
- RANDOM - tech level will be randomized before each round (low/medium/high/mixed)
- RANDOM PER PLAYER - tech level will be randomized for each player before each round (thus one can get light units, the other one heavy, yet another mixed etc)

✅ **Unit composition**
- FIXED - players will receive units according to a hardcoded template
- RANDOM - units will be generated randomly from those available in the current tech level
- UNIFORM - one unit kind will be randomized (limited by tech level) and will be used for the entire army
- X-FACTION variants - same as above, but faction also gets randomized before each round
- MIXED FACTION RANDOM - units will be generated randomly from those available in the current tech level. Generated units can be of mixed factions.

✅ **Weather**
- OFF - no weather effects
- DYNAMIC - randomized weather effects, changing every few minutes
- RAIN - constant rain
- SNOW - constant snow
- RAINSTORM - constant storm
- METEOR RAIN - constant meteor rain
- ARMAGEDDON - meteor rain starting after 50% of round duration

**Tips**
- Money value shows alternately your points in current round and total points
- Most variants can be achieved by modifying Tech level and Unit Composition settings. A few examples:
  - LOW/FIXED - players will receive in each round a set of hardcoded light units of their faction
  - LOW/RANDOM - players will receive in each round a set of random light units of their faction
  - LOW/X-FACTION RANDOM - players will receive in each round a set of random light units of a random faction
  - MIXED/RANDOM - players will receive in each round a set of random units of different tiers of their faction
  - RANDOM/FIXED - players will receive in each round a set of hardcoded units of a random tier (low/medium/high/mixed) of their faction. The randomized tier is the same for all players
  - RANDOM PER PLAYER/X-FACTION RANDOM - players will receive in each round a set of random units of a random tier (low/medium/high/mixed) of a random faction. The tier is randomized per player, so one player could get light units, and the other one could get heavy units in the very same round.
  - RANDOM/X-FACTION UNIFORM - players will receive in each round a set of multiple instances of exactly the same random unit of a random faction. Unit faction, tier and type is randomized independently - one player can get MG Salamander, another can get a pack of immortal Grizzlies.