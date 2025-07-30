ascii_art="
NETWORK
"

echo -e "\n$ascii_art\n"

sudo pacman -S --noconfirm iwd networkmanager dhcpcd

echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf

sudo mkdir -p /etc/iwd
sudo touch /etc/iwd/main.conf >/dev/null

echo "[General]" | sudo tee /etc/iwd/main.conf
echo " EnableNetworkConfiguration=true" | sudo tee -a /etc/iwd/main.conf

sudo systemctl enable iwd
sudo systemctl start iwd

sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
