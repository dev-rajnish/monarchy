#!/bin/bash

#1 download just waybar folder from monarchy/dotfiles/waybar in temp/

# 2 move that folder to ~/.config/waybar if folder exist backup name=waybar.before-monarchy

# 3 check for dependencies needed for waybar 
  ## dependencies are waybar, fuzzel, hyprland, wl-clipboard, nwg-clipman,\
  ##swaync, hyprshot, waypaper, swww, hyprpicker, pavucontrol, wlogout \
  ## wallust

# 6 restart waybar , pkill waybar && waybar



#### ==> code
#set -x

WAYBAR_REPO="https://github.com/dev-rajnish/monarchy.git"
WAYBAR_TEMP="/tmp/waybar-monarchy"
WAYBAR_DEST="$HOME/.config/waybar"
HYPR_CONFIG_DIR="$HOME/.config/hypr/hyprland.d"
HYPR_MAIN="$HOME/.config/hypr/hyprland.conf"
SERVICE_CONF_NAME="hyprland-exec-waybar-services.conf"

# 1. Clone only waybar folder from repo (sparse clone)
if [ -d "$WAYBAR_TEMP" ]; then
    rm -rf "$WAYBAR_TEMP"

fi
echo "[1/6] Cloning waybar config..."
git clone --depth 1 --filter=blob:none --sparse "$WAYBAR_REPO" "$WAYBAR_TEMP"
cd "$WAYBAR_TEMP"
git sparse-checkout set dotfiles/waybar

# 2. Move to ~/.config/waybar (backup if exists)
echo "[2/6] Setting up ~/.config/waybar..."
if [ -d "$WAYBAR_DEST" ]; then
    rm -rf "${WAYBAR_DEST}.before-monarchy"
    mv "$WAYBAR_DEST" "${WAYBAR_DEST}.before-monarchy"
    echo "→ Backed up existing waybar config to ~/.config/waybar.before-monarchy"
fi
mv "$WAYBAR_TEMP/dotfiles/waybar" "$WAYBAR_DEST"

# 3. Check required dependencies
echo "[3/6] Checking dependencies..."
REQUIRED_PKGS=(
    waybar fuzzel hyprland wl-copy nwg-clipman swaync hyprshot waypaper
    swww hyprpicker  pavucontrol wlogout wallust brightnessctl wpctl playerctl
)
MISSING_PKGS=()
for pkg in "${REQUIRED_PKGS[@]}"; do
    if ! command -v "$pkg" >/dev/null 2>&1; then
        MISSING_PKGS+=("$pkg")
    fi
done

if [ "${#MISSING_PKGS[@]}" -gt 0 ]; then
    echo "⚠️  Missing packages: ${MISSING_PKGS[*]}"
    echo "Please install them manually or via your package manager (paru/pacman)"
else
    echo "✅ All dependencies found"
fi

# 6. Restart Waybar
echo "[6/6] Restarting Waybar..."
pkill waybar 

waybar -l off &

echo "✅ Waybar setup complete under 'monarchy'"

exit
