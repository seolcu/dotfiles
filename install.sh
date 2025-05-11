#!/bin/bash

sudo pacman -S --noconfirm --needed hyprland kitty wofi dunst waybar power-profiles-daemon brightnessctl playerctl wl-clipboard grim slurp hyprpaper hypridle hyprlock swayosd network-manager-applet uwsm xdg-desktop-portal-hyprland hyprpolkitagent qt5-wayland qt6-wayland noto-fonts-cjk ttf-jetbrains-mono-nerd git github-cli stow htop fastfetch neovim flatpak starship firefox nautilus evince obsidian prismlauncher imv mpv proton-vpn-gtk-app 

git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin

yay -S --noconfirm --needed kime-bin clipse-bin visual-studio-code-bin

flatpak install -y flathub com.usebottles.bottles com.github.tchx84.Flatseal org.onlyoffice.desktopeditors

stow background dunst hypr kime kitty uwsm waybar wofi

systemctl --user enable --now hyprpolkitagent
systemctl --user enable --now waybar
systemctl --user enable --now hyprpaper
systemctl --user enable --now hypridle

# Virtualization
sudo pacman -S --noconfirm --needed libvirt dnsmasq openbsd-netcat virt-manager qemu-full
sudo systemctl enable --now libvirtd.socket
sudo usermod -aG libvirt $USER

# Gaming
sudo pacman -S --noconfirm --needed steam ttf-liberation gamemode lib32-gamemode gamescope
sudo usermod -aG gamemode $USER
echo "vm.max_map_count = 2147483642" | sudo tee /etc/sysctl.d/80-gamecompatibility.conf

# Catppuccin GTK theme
sudo pacman -S --noconfirm --needed gtk-engine-murrine nwg-look
git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git
cd Catppuccin-GTK-Theme/themes
./install.sh
./install.sh -l
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons
flatpak override --user --filesystem=xdg-config/gtk-4.0
sudo flatpak override --filesystem=xdg-config/gtk-4.0
cd ../..
rm -rf Catppuccin-GTK-Theme
