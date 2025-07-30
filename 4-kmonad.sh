yay -S --noconfirm --needed kmonad

sudo cp ~/.config/kmonad/kmonad.service /usr/lib/systemd/system/kmonad.service

sudo mkdir -p /etc/kmonad >/dev/null

sudo cp ~/.config/kmonad/config.kbd /etc/kmonad/config.kbd

sudo systemctl enable --now kmonad
sudo systemctl start kmonad
sudo systemctl daemon-reload
sudo systemctl status kmonad
