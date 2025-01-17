#!/bin/bash

# Ask the user if they want to install required packages
while true; do
  read -p "Install required packages for the JDotfiles? (y/n): " choice

  case "$choice" in
    y|Y)
      yay -S ttf-nerd-fonts-symbols-common ttf-opensans ttf-font-awesome ttf-bistream-vera ttf-dejavu ttf-liberation sway-bg otf-font-awesome wl-roots
      install
      echo "Finished install, you can start sway now"
      break
      ;;
    n|N)
      install
      break
      ;;
    *)
      echo "Invalid choice, please enter y or n."
      ;;
  esac
done

# Define the install function
install() { 
  git clone https://github.com/coderstarrer/dotfiles.git
  cd ~/dotfiles
  mv rofi sway waybar ~/.config/
}
