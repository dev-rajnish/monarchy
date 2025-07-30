yay -S --noconfirm --needed \
	hyprland hyprshot hyprpicker hyprlock hypridle \
	hyprpolkitagent hyprland-qtutils \
	xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

# Start Hyprland on first session
echo "[[ -z \$DISPLAY && \$(tty) == /dev/tty1 ]] && exec dbus-run-session Hyprland" > \
	~/.bash_profile
