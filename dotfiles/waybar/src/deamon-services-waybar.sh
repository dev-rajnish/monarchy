#!/bin/bash
# 5. Tee to hyprland.conf if not already included
HYPR_CONF="$HOME/.config/hypr/hyprland.d/deamons-services-autostart.conf"

if ! grep -q "swww-daemon"  "$HYPR_CONF"; then
    echo "exec-once = swww-daemon &" >> "$HYPR_CONF"

else
    echo "→ Already included in hyprland.conf"
fi

if ! grep -q "swww restore" "$HYPR_CONF"; then
    echo "exec-once = swww restore &" >> "$HYPR_CONF"

else
    echo "→ Already included in hyprland.conf"
fi

if ! grep -q "swaync" "$HYPR_CONF"; then
    echo "exec-once = swaync" >> "$HYPR_CONF"

else
    echo "→ Already included in hyprland.conf"
fi

if ! grep -q "wl-paste" "$HYPR_CONF"; then
    echo "exec-once = wl-paste --type text --watch cliphist store &" >> "$HYPR_CONF"
    echo "exec-once = wl-paste --type image --watch cliphist store &" >> "$HYPR_CONF"
  
  else
    echo "→ Already included in hyprland.conf"
fi

if ! grep -q "hypridle" "$HYPR_CONF"; then
    echo "exec-once = hypridle &" >> "$HYPR_CONF"

else
    echo "→ Already included in hyprland.conf"
fi


if ! grep -q "waybar" "$HYPR_CONF"; then
    echo "exec-once = waybar &" >> "$HYPR_CONF"

else
    echo "→ Already included in hyprland.conf"
fi


