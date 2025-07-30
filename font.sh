yay -S --noconfirm --needed \
  ttf-jetbrains-mono-nerd \
  nerd-fonts-noto-sans-regular-complete \
  ttf-material-symbols-variable-git \
  ttf-victor-mono-nerd

FONT_UI="Noto Sans"
FONT_TERM="JetBrainsMono Nerd Font"
FONT_ITALIC="Vector Nerd Font"
SIZE=12

echo "🔤 Setting fonts: UI=$FONT_UI, Term=$FONT_TERM"

# GTK Fonts
for ver in gtk-3.0 gtk-4.0; do
  mkdir -p ~/.config/$ver
  echo "gtk-font-name=$FONT_UI $SIZE" >>~/.config/$ver/settings.ini
done

# Qt Fonts
mkdir -p ~/.config/qt5ct ~/.config/qt6ct
for qt in qt5ct qt6ct; do
  cat >~/.config/$qt/$qt.conf <<EOF
[Fonts]
general=$FONT_UI,$SIZE,-1,5,50,0,0,0,0,0
fixed=$FONT_TERM,$SIZE,-1,5,50,0,0,0,0,0
EOF
done

# Kitty
mkdir -p ~/.config/kitty
echo -e "\n# Font\nfont_family      $FONT_TERM\nitalic_font      $FONT_ITALIC\nfont_size        $SIZE" >>~/.config/kitty/kitty.conf

# Foot
mkdir -p ~/.config/foot
echo -e "[main]\nfont=$FONT_TERM:size=$SIZE\nitalic-font=$FONT_ITALIC" >>~/.config/foot/foot.ini

echo "✅ Fonts applied."
