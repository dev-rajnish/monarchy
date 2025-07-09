#!/bin/bash
# 5. Tee to hyprland.conf if not already included
HYPR_CONF="$HOME/.config/hypr/hyprland.d/deamons-services-autostart.conf"

if ! grep -q "sww-deamon" "$HOME/.config/hypr/hyprland.d/deamons-services-autostart"; then
    echo "exec-once = swww-daemon &" >> "$HYPR_CONF"

else
    echo "→ Already included in hyprland.conf"
fi

if ! grep -q "swww restore" "$HOME/.config/hypr/hyprland.d/deamons-services-autostart"; then
    echo "exec-once = swww restore &" >> "$HYPR_CONF"

else
    echo "→ Already included in hyprland.conf"
fi

if ! grep -q "swaync" "$HOME/.config/hypr/hyprland.d/deamons-services-autostart"; then
    echo "exec-once = swaync" >> "$HYPR_CONF"

else
    echo "→ Already included in hyprland.conf"
fi

if ! grep -q "wl-paste" "$HOME/.config/hypr/hyprland.d/deamons-services-autostart"; then
    echo "exec-once = wl-paste --type text --watch cliphist store &" >> "$HYPR_CONF"
    echo "exec-once = wl-paste --type image --watch cliphist store &" >> "$HYPR_CONF"
  
  else
    echo "→ Already included in hyprland.conf"
fi

if ! grep -q "hypridle" "$HOME/.config/hypr/hyprland.d/deamons-services-autostart"; then
    echo "exec-once = hypridle &" >> "$HYPR_CONF"

else
    echo "→ Already included in hyprland.conf"
fi


if ! grep -q "waybar" "$HOME/.config/hypr/hyprland.d/deamons-services-autostart"; then
    echo "exec-once = waybar &" >> "$HYPR_CONF"

else
    echo "→ Already included in hyprland.conf"
fi


