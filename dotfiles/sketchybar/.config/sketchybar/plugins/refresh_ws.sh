#!/usr/bin/env bash
LOCK="/tmp/refresh_ws.lock"
if [ -f "$LOCK" ]; then
  exit 0
fi
trap 'rm -f "$LOCK"' EXIT
touch "$LOCK"

PLUGIN_PATH="$HOME/.config/sketchybar/plugins"

for sid in {1..10}; do
  sketchybar --remove "space.$sid" 2>/dev/null
done

for sid in {1..10}; do
  if aerospace list-windows --workspace "$sid" | grep -q .; then
    sketchybar --add item "space.$sid" left \
        --subscribe "space.$sid" aerospace_workspace_change \
        --set "space.$sid" \
        background.color=0x44ffffff \
        background.corner_radius=5 \
        background.height=20 \
        background.drawing=off \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$PLUGIN_PATH/aerospace.sh $sid"
  fi
done
