### Earth 2150: The Moon Project
### Advanced AI mod v1.2
*by Guardian*


This is a mod for The Moon Project that provides extremely strong AI for Skirmish or Multiplayer games.
#### Key features
- AI is almost completely rebuilt from scratch. Native inefficient code was replaced by new implementation.
- 24 new bots - 6 difficulty levels (`[VE]` - Very Easy, `[E]` - Easy, `[M]` - Medium, `[H]` - Hard, `[VH]` - Very Hard and `[I]` - Impossible) and 4 tech focus variants:
   - Mars (Cannon)
   - Jupiter (Energy)
   - Quirinus (Rockets)
   - Fortuna (random)
- New game mode (**bots will work only in that gamemode**) based on "IEO - Destroy enemy structures" mode
- **AI is fair** - there are no free units or any unfair advantages for the bots. **It's NOT as in Lost Souls**.
- The highest difficulty level is incredibly difficult. I would estimate it to be at least **100-150x** stronger
  than what built-in Experts could offer. Beating ED/UCS `[I]`mpossible bot in a 1v1 is virtually impossible for human 
  players. Lower difficulty levels should be manageable for everyone, so **everyone can have fun from this mod**.
  Still, even lower difficulty levels can prove very tricky, especially for non-multi players.
- Accelerated LC mode (more builders for LC)

#### Limitations
- In the current version AI cannot play in other modes than Techwar (infinite) money. There are also
  some options available that limit all players (or just AI) researches of MDW, bombs and/or artillery.
  The mod is intended to support economy mode in future versions.
- LC players are very weak compared to ED/UCS players, but that's not AI limitation, but the game limitation.
  LC just cannot build faster than it currently does, what makes it multiple times weaker in Techwar.
  Despite accelerated LC mode, `[I]`mpossible LC bot still cannot beat `[M]`edium ED/UCS bots in a 1v1.
- The mod provides a few custom maps with ` (AI)` prefix. Those maps are very open and flat, but that's only
  to make life easier for bots. Bots should generally work on other maps, but they may be having some issues,
  with units blocking themselves, builders attempting to build in unreachable locations, etc.
- Saving and loading a game will break bots behaviour. They will still "play", but reloading will make them
  stop repairing building complexes, may cause issues with constructing supply centers etc. It is generally
  **not recommended to reload**.

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
