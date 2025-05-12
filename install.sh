#!/bin/bash

git pull

sudo pacman -S --noconfirm --needed hyprland kitty wofi dunst waybar power-profiles-daemon brightnessctl playerctl pavucontrol alsa-utils wl-clipboard grim slurp hyprpaper hypridle hyprlock swayosd network-manager-applet uwsm xdg-desktop-portal-hyprland hyprpolkitagent qt5-wayland qt6-wayland noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd btrfs-progs dosfstools exfatprogs f2fs-tools ntfs-3g xfsprogs udftools git github-cli stow htop fastfetch neovim starship curl wget man-db man-pages texinfo flatpak breeze qt5ct kvantum-qt5 kvantum firefox nautilus evince obsidian prismlauncher neovide imv mpv obs-studio kdeconnect dolphin proton-vpn-gtk-app gcc jdk-openjdk python-pip python-ipykernel python-black nodejs hugo

git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin

yay -S --noconfirm --needed kime-bin clipse-bin visual-studio-code-bin qt6ct-kde

flatpak install -y flathub com.usebottles.bottles com.github.tchx84.Flatseal org.onlyoffice.desktopeditors us.zoom.Zoom

xdg-user-dirs-update
xdg-user-dirs-gtk-update

stow --adopt Kvantum background bash dunst hypr kime kitty qt5ct qt6ct uwsm waybar wofi
git reset --hard

systemctl --user enable hyprpolkitagent
systemctl --user enable waybar
systemctl --user enable hyprpaper
systemctl --user enable hypridle

# Bluetooth
sudo pacman -S --noconfirm --needed bluez bluez-utils blueberry
sudo systemctl enable --now bluetooth

# Virtualization
sudo pacman -S --noconfirm --needed libvirt dnsmasq openbsd-netcat virt-manager qemu-full
sudo systemctl enable --now libvirtd.socket
sudo usermod -aG libvirt $USER

# Gaming
# needs confirm: selection of video drivers
sudo pacman -S --needed steam ttf-liberation gamemode lib32-gamemode gamescope
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