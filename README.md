# Pokémon GO Assets

A collection of Pokémon GO game data and UI assets for developers building companion apps, tools, and fan projects.

## Contents

### Data (`public/data/`)

#### Pokémon (`public/data/pokemon/`)

| File | Description |
|------|-------------|
| `released.json` | All Pokémon currently available in-game |
| `types.json` | Type assignments for each Pokémon |
| `stats.json` | Base stats (Attack, Defence, Stamina) |
| `evolutions.json` | Evolution chains and requirements |
| `forms.json` | Regional variants, costumes, and alternate forms |
| `generations.json` | Generation groupings |
| `genders.json` | Gender ratios |
| `rarity.json` | Rarity classifications |
| `shiny.json` | Shiny availability |
| `shadow.json` | Shadow/Purified availability |
| `mega.json` | Mega Evolution data |

#### Moves (`public/data/moves/`)

| File | Description |
|------|-------------|
| `fast.json` | Fast move statistics |
| `charged.json` | Charged move statistics |
| `pvp-fast.json` | PvP-adjusted fast moves |
| `pvp-charged.json` | PvP-adjusted charged moves |
| `pokemon-moves.json` | Current movepool assignments |

#### PvP Rankings (`public/data/pvp/`)

| File | Description |
|------|-------------|
| `rankings-1500.json` | Great League rankings |
| `rankings-2500.json` | Ultra League rankings |
| `rankings-10000.json` | Master League rankings |

#### Meta (`public/data/meta/`)

| File | Description |
|------|-------------|
| `cp-multiplier.json` | CP multiplier values by level |
| `api-hashes.json` | Data version hashes |

### Images (`public/images/`)

| Category | Contents |
|----------|----------|
| `adventure-effects/` | Adventure effects banners and portraits |
| `appraisal/` | IV appraisal indicators |
| `buddy/` | Buddy system icons |
| `combat/` | Battle interface icons |
| `dynamax/` | Dynamax and Gigantamax icons |
| `evolution/` | Evolution UI elements |
| `filters/` | Search and filter icons |
| `friends/` | Friend system icons |
| `menu/` | Navigation, buttons, UI elements |
| `pokedex/` | Pokédex interface elements |
| `pokestops-gyms/` | Location markers and badges |
| `rocket/` | Team GO Rocket icons |
| `search-tags/` | Search filter category icons |
| `today-view/` | Daily activity icons |
| `types/` | Type badges and icons |
| `ui/` | Miscellaneous UI sprites |

### Logo (`public/logo/`)

Project branding assets.

## Updating Data

Run the sync script to fetch the latest data from upstream sources:

```bash
./scripts/sync-data.sh
```

This fetches fresh data from PoGoAPI and clones the latest PvPoke rankings from GitHub.

## Usage

These assets are intended for:

- Fan-made companion apps and tools
- IV calculators and team builders
- PvP analysis tools
- Educational and research projects

### Example: Loading Data

```javascript
// Browser/Node.js
const pokemon = await fetch('./public/data/pokemon/released.json')
  .then(res => res.json());

console.log(pokemon['25']); // { id: 25, name: 'Pikachu' }
```

```python
# Python
import json

with open('public/data/pokemon/stats.json') as f:
    stats = json.load(f)

print(stats['149'])  # Dragonite stats
```

## File Structure

```
public/
├── data/
│   ├── meta/
│   ├── moves/
│   ├── pokemon/
│   └── pvp/
├── images/
│   ├── adventure-effects/
│   ├── appraisal/
│   ├── buddy/
│   ├── combat/
│   ├── dynamax/
│   ├── evolution/
│   ├── filters/
│   ├── friends/
│   ├── menu/
│   ├── pokedex/
│   ├── pokestops-gyms/
│   ├── rocket/
│   ├── search-tags/
│   ├── today-view/
│   ├── types/
│   └── ui/
└── logo/
```

## Credits

### PoGoAPI

Game data provided by [PoGoAPI](https://pogoapi.net/) — a comprehensive Pokémon GO API offering up-to-date game master data including Pokémon stats, moves, evolutions, and more.

- Website: https://pogoapi.net/
- GitHub: https://github.com/PoGoAPI

### PokeMiners

Game assets sourced from [PokeMiners](https://pokeminers.com/) — a community project that datamines and catalogues assets from the Pokémon GO game client.

- Website: https://pokeminers.com/
- Twitter: https://twitter.com/paborPokemon

### PvPoke

PvP rankings data from [PvPoke](https://pvpoke.com/) — the leading Pokémon GO PvP resource for battle simulations and tier rankings.

- Website: https://pvpoke.com/
- GitHub: https://github.com/pvpoke/pvpoke

### Original Game Assets

Pokémon GO game assets are the property of Niantic, Inc. and The Pokémon Company.

## Disclaimer

Pokémon GO is a trademark of Niantic, Inc. Pokémon and Pokémon character names are trademarks of Nintendo. This repository is not affiliated with, endorsed by, or connected to Niantic or Nintendo. All game assets remain the property of their respective owners and are provided here for non-commercial, educational purposes only.
