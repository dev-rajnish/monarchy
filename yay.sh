ascii_art="
╖  ╓ ╒══╗ ╖  ╓ 
║  ║ ╔══╣ ║  ║ 
╚══╣ ╚══╝ ╚══╣ 
   ║         ║ 
╘══╝      ╘══╝ "

echo -e "\n$ascii_art\n"

sudo pacman -S --needed --noconfirm base-devel

if ! command -v yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd ~
fi
