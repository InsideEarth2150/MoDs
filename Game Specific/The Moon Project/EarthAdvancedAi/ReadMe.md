### Earth 2150: The Moon Project
### Advanced AI mod v1.7
*by Guardian*

**WARNING: There are two custom game modes here - the one with "-MP-" in name should be used only in 2.2.2.2+ multiplayer patch. It will be broken and may crash in SP patch. Use the first game mode (IEO-AdvAI-DestroyStructures) for single player.

This is a mod for The Moon Project that provides extremely strong AI for Skirmish or Multiplayer games.
#### Key features
- AI is almost completely rebuilt from scratch. Native inefficient code was replaced by new implementation.
- 24 new bots - 6 difficulty levels (`[VE]` - Very Easy, `[E]` - Easy, `[M]` - Medium, `[H]` - Hard, `[VH]` - Very Hard and `[I]` - Impossible) and 4 tech focus variants:
   - Mars (Cannon - UCS can randomly go for Grenades, LC will go for MG + Sonic)
   - Jupiter (Energy)
   - Quirinus (Rockets)
   - Fortuna (random of the above)
- New game mode (**bots will work only in that gamemode**) based on "IEO - Destroy enemy structures" mode
- **AI is fair** - there are no free units or any unfair advantages for the bots. **It's NOT as in Lost Souls**.
- The highest difficulty level is incredibly difficult. In TechWar mode, I would estimate it to be at least **100-150x** stronger
  than what built-in Experts could offer. Beating ED/UCS `[I]`mpossible bot in a TechWar 1v1 is virtually impossible for human 
  players. Lower difficulty levels should be manageable for everyone, so **everyone can have fun from this mod**.
  Still, even lower difficulty levels can prove very tricky, especially for non-multi players.
- In modes with mining resources, the strongest AI plays at a level of a strong MP player and even the strongest multi player can lose a 1v1 if they are caught off guard.

#### Limitations
- LC players are very weak compared to ED/UCS players, but that's not AI limitation, but the game limitation.
  LC just cannot build faster than it currently does, what makes it multiple times weaker in Techwar.
  Despite accelerated LC mode, `[I]`mpossible LC bot still cannot beat `[M]`edium ED/UCS bots in a TechWar 1v1.
- in economy modes, LC is still weaker than others, but the difference is not that big anymore
- The mod provides quite a few custom maps with ` (AI)` prefix. Those maps should work well with this mod.
  On other maps, bots may experience some issues with mining resources, units blocking themselves,
  builders attempting to build in unreachable locations, etc.
- Saving and loading a game will crash the game. For now, it ** is not possible to reload**.

#### Installation
1. Ensure that you have your game patched to at least **2.1.1.1** (singleplayer) or **2.2.1.3** (multiplayer) patch.
2. Remove any earlier version of the mod (both .ieo and .wd files)
3. Place the `.ieo` file inside `Modules` directory in your game folder
4. Place the `.wd` file inside `WD Files` directory in your game folder.

#### Credits
This mod was created by *Guardian* from Inside Earth Operations. <br/>
There were however other people from Inside Earth community involved. <br/>
**Level design**: *Szakael* <br/>
**Scripts**: *Keter*, *Kumu* <br/>
**Tests**: *Ajack*, *Animal*, *Noctis*, *Szakael*

#### Changelog
v1.7:
- AI players can now be controlled by human teammates via buttons available upon selecting any of the bot's structure
- LC will now research, build and use WCC if season allows rainstorm or meteors [H+]
- in team games, one of AI players may decide to rush MDW [H+]
- combat improvements:
   - units are better at using sonic cannons [H+]
   - improved aircraft control - air units flee from enemies that can shoot them down, air units can focus fire power plants etc [VH+]
   - units retreat from combat when outnumbered [H+]
   - when heavily outnumbering enemy units, units may decide to attack farther enemies instead of closest (this simulates chasing down a retreating army) [VH+]
   - improved targeting for units - AI now has more detailed targeting preferences. For example, they will prefer attacking armed targets over unarmed ones, aircraft will focus fire AA targets first, etc. [H+]
- army control:
   - AI is more eager to atack if it is stronger than the enemy, while staying more defensive when it is weaker
   - AI actively uses its forces in assemble and preparation phases - they will join ongoing nearby battles, defend own/ally base and attack expansions [VH+]
   - AI is more likely to initiate attacks at night [VH+]
   - AI ceases attack if it has no radars against shadows [M+]
- army composition:
   - AI produces more radars if enemy has shadows
   - AI produces LC detectors [M+]
   - AI produces LC shield rechargers [VH+]
   - AI can dynamically adjust constructed units to the battlefield. This includes producing anti-energy light units, AA units, tech switches etc [H+]
   - [I]mpossible AI is no longer reluctant to using aircraft (it won't produce them against rockets or enemies with AA however)
- split aircraft researches into light (plasma Gargoyles, MG SuperFighters etc) and heavy (hR) paths
- AI shares LC detectors and shield rechargers with teammates (including human players) [VH+]
- AI will no longer mount unupgraded weapons on structures
- AI can transfer builders to non-LC allies (inlcuding human) who are short on them [VH+]
- AI can transfer money to allies (including human) with at least 2x weaker economy. Among other benefits, this helps with recovery from economy raids.
- better money managament - bots will save more money for artillery ammo [I]
- ED can build outposts in area of intensified combat
- AI can mount shields on civil units [VH+]
- AI build small tower with banner next to MDW [H+]
- in endless resources mode, AI will build flying harvest and extract resources from free dots of its ED/LC allies [I]
- AI builds standalone, small SDI complexes [M+]
- LC now produces two types of production complexes, which intends to safe some space
- starting with 10th resource field, UCS assigns harvesters based on proximity to resource fields, rather than in a sequential order of mining complex construction
- AI is less likely to resign - it won't resign if it has at least 50 factories (was 100) or has at least 100 units. The required ratio of current vs lost buildings got also hardened
- improved base coverage calculations - AI is less likely to assemble units in weird spots
- improved shield selection for some units
- fixed a small memory leak in commands execution
- fixed AI not building reactors for UCS, which used to lead to energy shortages after building SDI and radars
- AI no longer switches lights to AUTO when cloaked and there are enemies nearby, even when retreating
- LC will always keep a bit more sprare money, so that it won't run into a situation where it cannot accumulate enough money for power plants or mines
- at game start, AI reserves space for supply center, so that it won't attempt to build it outside of its own base
- fixed (again) AI replacing own existing templates instead of creating new, alternative ones (for mobile artillery, etc)
- shadow countering no longer happens in clearly unfair manner
- LC will build power plants near complexes that are out of power range
- fixed broken randomization at game start
- UCS can hold more spare harvesters if its economy can hold it (which means faster expansion in bigger games)
- added over 500 (yes, five hundred) new speech lines for the AI, so that what they say is now less repetitive. AI can additionally make comments when it is getting under high pressure, or when it is getting close to the won position. There are also "comeback" lines, when AI brings an almost lost game back to equal (I'm not sure if we will ever see them though...). AI speech is also split into 5 different personalities, so that the messages said by the AI within the same game should stay more or less coherent
- LC uses initial Phobos to scout enemy base (although the main gain here is, that the Phobos doesn't obstruct building placement)
- AI is more likely to build additional supply centers when using aircraft
- AI will try to rush if it outnumbers opponents by at least x1.5 count - even on large levels
- AI can detect crowded/clustered battles, which makes researching artillery (both mobile and static) more likely, as well as production of artillery units (used to be restricted to strengthen phase)
- new version of FFA Equality (1.3) with slightly reworked resource fields
- new version of Battle Empire (1.1) with some small fixes
- fixed a bug in army management, which caused the armies to intervene in battles in rather random fashion
- fixed LC not building WCC at all
- sonics used to be occasionally turning lights off in combat
- AI could attempt to place SDI complex in invalid places
- non-Jupiter bots attempting to ion rush used to research ion cannon and then still produce pamirs, thus wasting time and resources on researching ion

v1.6:
- fixed a bug with AI starting and cancelling production of air units in TechWar leading to underperformance (a bug introduced in 1.3)
- reworked a bit units composition mechanics, the ratio between different unit kinds produced in mixed armies (for example Cannon + Grenades) should be now more stable
- AI will no longer underestimate towers, AI attempts to counter heavy towers/fortresses turtling.
- changed AI platoon size from 6 to 1 ([H+]). With more units count, it can dynamically scale. Size 6 was introduced very early for techwar. Theoretically, size 1 should be better, but it is hard to tell based on AI vs AI games.
- reworked base shape recognition. It used to be a rectangle limited by the most outside factories. With AI building them now next to expansions too, it quickly leads to the AI considering the entire map as its "base", which disrupts attacking routines and many more. AI can now recognize irregular shapes and form unit lines along those irregular shapes (for example, in an L-shaped base in the corner of Surrounded map, AI will also form units in L shape, instead of trying to assemble somewhere at the center of the map)
- AI will no longer target walls within its allies bases. Technically, if a 16x16 chunk contains at least 5 friendly (excluding own) strucutres, the walls within it will not be targeted.
- AI will no longer attack uniformly along the entire offensive line, but will pick randomly some part of it (the units will most likely spread out anyway, so again it is hard to tell if it is going to change anything). It works for teams with [VH+] leader.

v1.5:
- fix LC power issues in x1 research speed
- fix ED Quirinus weapon selection (he could prefer cannons over rockets)
- small production queue fixes (a bit more banners and radars, removed single aircraft unit that gets produced after researching aircraft)
- better rush defense
- reduce ED and LC factories count
- fix UCS selling buildings multiple times (the bug reappeared at some point)
- AI will build SDI and stationary radars when they are needed (used to build only if it had plenty of spare money, which doesn't happen for better bots)
- dynamic builder count - AI will adjust builders amount to current needs instead of producing some hardcoded amount
- new FFA Equality versions - `[B] v1` and `[B] v1.1`
- AI will no longer drop shields below medium if enemy UCS MDW exists
- bots will focus fire artillery and LC mines
- "big game mode" - if AI has more than 12 own, uncontested resource fields it will enter an alternative mode, similar to the recent FFA challenge. It will generally be more economy focused in early minutes.
- ED will attempt to reset and fix taigas that cannot reach mine (it sometimes happened when they got blocked by a builder occupying the "pick up" spot)
- ED Jupiter will no longer produce Urals **(`[I]` only)**
- fixed a bug where AI could send units to the northern edge of the map when it couldn't figure out the correct attack direction
- fixed a bug in endless resources mode, where resources could seemingly disappear
- new `Ieo.CheckLevel` command for editor, that lists (and saves to the log file) potential issues that the AI may have with the current level

v1.4:
- new gamemode for 2.2.2.2+ patch only (it will be unified in the future)
- fix game crashing in SP patch
- fix building, rebuilding and expansion issues
- fix LC building structures in hostile areas
- disable AA Salamanders (again)
- reduce transmitters count for each UCS military complex 4 > 2
- soften artillery fire conditions in eco mode (still more harsh than in techwar)
- add supply center to each artillery complex, just like in TechWar
- mount banners on all supply centers
- disable guardian dropping in TechWar
- fix missing unit names in AI unit templates
- AI uses player colours when talks about other players, to make them more distinguishable

v1.3:
- added economy modes (with mining resources)
- multiple AI improvements and enhancements

v1.2:
- added research mode for bots
- rebalanced AI difficulty levels, so that `[VE]` and `[E]` bots are noticeably easier.
- ED bots now use ballistic rockets (`[I]`mpossible only)
- smaller fixes/adjustments

v1.1:
- Kumu's builder script for human players that allows following recorded orders without unnecessary delays
- Accelerated LC mode (more builders for LC, `[I]` LC bot is now somewhere between `[E]` and `[M]` ED/UCS bot)
- building complexes for LC
- AI uses standard aircraft `[E]`asy+)
- AI rushes with aircraft `[VH]`+
- AI no longer "cheats" with artillery/MDW by targeting structures that it shouldn't be aware of
- new versions of AI maps + new levels
- rebalanced some difficulty levels
