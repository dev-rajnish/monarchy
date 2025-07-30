yay -S --noconfirm --needed \
  bibata-cursor-theme-bin

# === Cursor settings ===
CURSOR="Bibata-Modern-Ice"
SIZE=24

echo "🖱️ Setting cursor: $CURSOR (size $SIZE)"

# === 1. Install cursor theme (if not already installed)
if ! pacman -Qq | grep -q bibata-cursor-theme; then
  echo "📦 Installing bibata-cursor-theme..."
  yay -S --noconfirm bibata-cursor-theme-bin
fi

# === 2. GTK (3 and 4)
for gtk in gtk-3.0 gtk-4.0; do
  mkdir -p ~/.config/$gtk
  sed -i '/^gtk-cursor-theme/d;/^gtk-cursor-theme-size/d' ~/.config/$gtk/settings.ini 2>/dev/null
  cat >>~/.config/$gtk/settings.ini <<EOF
[Settings]
gtk-cursor-theme-name=$CURSOR
gtk-cursor-theme-size=$SIZE
EOF
done

# === 3. Qt apps (Qt5/6ct)
mkdir -p ~/.config/qt5ct ~/.config/qt6ct
echo -e "[Appearance]\ncursor_theme=$CURSOR" >>~/.config/qt5ct/qt5ct.conf
echo -e "[Appearance]\ncursor_theme=$CURSOR" >>~/.config/qt6ct/qt6ct.conf

# === 4. System-wide X cursor (X11)
mkdir -p ~/.icons/default
cat >~/.icons/default/index.theme <<EOF
[Icon Theme]
Name=$CURSOR
Inherits=$CURSOR
EOF

# === 5. Xresources (for legacy apps)
echo -e "Xcursor.theme: $CURSOR\nXcursor.size: $SIZE" >>~/.Xresources

# === 6. Wayland / Shell fallback
for f in ~/.profile ~/.bashrc ~/.zshrc ~/.config/fish/config.fish; do
  grep -q XCURSOR_THEME "$f" 2>/dev/null || {
    echo "export XCURSOR_THEME=$CURSOR" >>"$f"
    echo "export XCURSOR_SIZE=$SIZE" >>"$f"
  }
done

echo "✅ Cursor applied: $CURSOR ($SIZE). Reboot or relogin to see changes."
