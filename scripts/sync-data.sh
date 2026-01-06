#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
POKEMON="$ROOT/public/data/pokemon"
MOVES="$ROOT/public/data/moves"
META="$ROOT/public/data/meta"
PVP="$ROOT/public/data/pvp"

mkdir -p "$POKEMON" "$MOVES" "$META" "$PVP"

echo "== PoGoAPI =="
base="https://pogoapi.net/api/v1"

echo "  Pokémon data..."
curl -fsSL "$base/released_pokemon.json" -o "$POKEMON/released.json"
curl -fsSL "$base/pokemon_types.json" -o "$POKEMON/types.json"
curl -fsSL "$base/pokemon_stats.json" -o "$POKEMON/stats.json"
curl -fsSL "$base/pokemon_evolutions.json" -o "$POKEMON/evolutions.json"
curl -fsSL "$base/pokemon_forms.json" -o "$POKEMON/forms.json"
curl -fsSL "$base/pokemon_generations.json" -o "$POKEMON/generations.json"
curl -fsSL "$base/pokemon_genders.json" -o "$POKEMON/genders.json"
curl -fsSL "$base/pokemon_rarity.json" -o "$POKEMON/rarity.json"
curl -fsSL "$base/shiny_pokemon.json" -o "$POKEMON/shiny.json"
curl -fsSL "$base/shadow_pokemon.json" -o "$POKEMON/shadow.json"
curl -fsSL "$base/mega_pokemon.json" -o "$POKEMON/mega.json"

echo "  Moves data..."
curl -fsSL "$base/fast_moves.json" -o "$MOVES/fast.json"
curl -fsSL "$base/charged_moves.json" -o "$MOVES/charged.json"
curl -fsSL "$base/pvp_fast_moves.json" -o "$MOVES/pvp-fast.json"
curl -fsSL "$base/pvp_charged_moves.json" -o "$MOVES/pvp-charged.json"
curl -fsSL "$base/current_pokemon_moves.json" -o "$MOVES/pokemon-moves.json"

echo "  Meta data..."
curl -fsSL "$base/cp_multiplier.json" -o "$META/cp-multiplier.json"
curl -fsSL "$base/api_hashes.json" -o "$META/api-hashes.json"

echo "== PvPoke Rankings (from GitHub) =="

TMP="$(mktemp -d)"
cleanup() { rm -rf "$TMP"; }
trap cleanup EXIT

git clone --depth 1 https://github.com/pvpoke/pvpoke.git "$TMP/pvpoke" >/dev/null 2>&1

fetch_from_repo() {
  local out="$1"
  shift
  local repo="$TMP/pvpoke"

  for path in "$@"; do
    if git -C "$repo" cat-file -e "HEAD:$path" 2>/dev/null; then
      echo "  found $path"
      git -C "$repo" show "HEAD:$path" > "$out"
      return 0
    fi
  done

  echo "ERROR: Could not find rankings file in PvPoke repo. Tried:"
  for path in "$@"; do echo "  - $path"; done
  return 1
}

fetch_from_repo "$PVP/rankings-1500.json" \
  "src/data/rankings/all/overall/rankings-1500.json" \
  "src/data/all/overall/rankings-1500.json" \
  "data/all/overall/rankings-1500.json" \
  "data/overall/rankings-1500.json"

fetch_from_repo "$PVP/rankings-2500.json" \
  "src/data/rankings/all/overall/rankings-2500.json" \
  "src/data/all/overall/rankings-2500.json" \
  "data/all/overall/rankings-2500.json" \
  "data/overall/rankings-2500.json"

fetch_from_repo "$PVP/rankings-10000.json" \
  "src/data/rankings/all/overall/rankings-10000.json" \
  "src/data/all/overall/rankings-10000.json" \
  "data/all/overall/rankings-10000.json" \
  "data/overall/rankings-10000.json"

echo "Done."
