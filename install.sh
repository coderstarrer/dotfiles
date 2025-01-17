#!/bin/bash
# Define the install function
function install_func { 
  cd ~/dotfiles || { echo "Directory ~/dotfiles not found. Exiting."; exit 1; }
  cd ~/.config
 rm -rf foot sway waybar rofi
cd ~/dotfiles
   mv  rofi sway waybar foot ~/.config
cd ~/.config
ls 
fd
}

# Ask the user if they want to install required packages
while true; do
  read -rp "Install required packages for the JDotfiles? (y/n): " choice

  case "$choice" in
    y|Y)
      sudo pacman -S --needed foot ttf-nerd-fonts-symbols-common ttf-opensans ttf-font-awesome \
        ttf-dejavu ttf-liberation sway swaybg otf-font-awesome wlroots || { echo "Package installation failed. Exiting."; exit 1; }
      install_func
      break
      ;;
    n|N)
      install_func
      break
      ;;
    *)
      echo "Invalid choice, please enter y or n."
      ;;
  esac
done
