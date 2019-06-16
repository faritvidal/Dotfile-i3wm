sudo#!/bin/bash -xe
#design for ubuntu 18.04 fully tested
#creted by Farit Vidal
#created at :6-13-2019
# script to install and configure all dependencies for use i3wm
echo "+++++++++++++++++++++++++++++"
echo "Installing dependencies"
echo "+++++++++++++++++++++++++++++"
sudo apt update && sudo apt upgrade -y 
sudo apt install -y lightdm suckless-tools ssh blueman terminator wget git zsh i3 neofetch htop ncdu unrar geany thunar lxappearance xbacklight pavucontrol flameshot rofi compton feh arandr network-manager-openvpn python-pip xfonts-terminus
echo "+++++++++++++++++++++++++++++"
echo "Install dockly"
echo "+++++++++++++++++++++++++++++"
sudo apt install npm
sudo npm install -g dockly
echo "+++++++++++++++++++++++++++++"
echo "install docker"
echo "+++++++++++++++++++++++++++++"
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
echo "+++++++++++++++++++++++++++++"
echo "Add permission in docker"
echo "+++++++++++++++++++++++++++++"
usermod -aG docker $USER
echo "+++++++++++++++++++++++++++++"
echo "install networking plugin for the menu in i3wm"
echo "+++++++++++++++++++++++++++++"
pip install netifaces
echo "+++++++++++++++++++++++++++++"
echo "change shell for the user to zsh"
echo "+++++++++++++++++++++++++++++"
chsh --shell /bin/zsh $USER
echo "+++++++++++++++++++++++++++++"
echo "Installion Brightness Control for laptop"
echo "+++++++++++++++++++++++++++++"
sudo add-apt-repository ppa:apandada1/brightness-controller
sudo apt-get update
sudo apt-get install -y brightness-controller
echo "+++++++++++++++++++++++++++++"
echo "Themes and Icons"
echo "+++++++++++++++++++++++++++++"
sudo add-apt-repository ppa:noobslab/macbuntu
sudo add-apt-repository ppa:noobslab/themes
sudo add-apt-repository ppa:noobslab/icons
sudo apt update && apt install -y macbuntu-os-icons-v1804 flat-remix-themes flat-remix-icons
echo "+++++++++++++++++++++++++++++"
echo "dependencies for i3lock"
echo "+++++++++++++++++++++++++++++"
sudo apt install -y scrot imagemagick
echo "+++++++++++++++++++++++++++++"
echo "Download the new menu for i3wm"
echo "+++++++++++++++++++++++++++++"
mkdir -p $HOME/.bin/scripts
cd $HOME/.bin/scripts/
git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git
sudo chown $USER:$USER -R bumblebee-status
cd -
echo "+++++++++++++++++++++++++++++"
echo "Copying the pictures"
echo "+++++++++++++++++++++++++++++"
cp $PWD/images/* $HOME/Pictures/
echo "+++++++++++++++++++++++++++++"
echo "Copying scripts files"
echo "+++++++++++++++++++++++++++++"
cp $PWD/scripts/* $HOME/.bin/scripts/
sudo chmod +x  $HOME/.bin/scripts/{lock.sh,i3exit} 
sudo chown $USER:$USER $HOME/.bin/scripts/{lock.sh,i3exit}
echo "+++++++++++++++++++++++++++++"
echo "Copying rofi theme"
echo "+++++++++++++++++++++++++++++"
cp $PWD/rofi/* $HOME/ && sudo chown $USER:$USER $HOME/Adapta.rasi
echo "+++++++++++++++++++++++++++++"
echo "Copying Font files"
echo "+++++++++++++++++++++++++++++"
mkdir -p $HOME/.fonts
cp $PWD/fonts/* $HOME/.fonts/ && sudo chown $USER:$USER $HOME/.fonts/*
echo "+++++++++++++++++++++++++++++"
echo "Copying i3wm Config File"
echo "+++++++++++++++++++++++++++++"
now=$(date +%Y-%m-%d)
mv $HOME/.config/i3/config $HOME/.config/i3/config_bkp_$now
cp $PWD/configFile/* $HOME/.config/i3/
sudo chown $USER:$USER $HOME/.config/i3/config
echo "+++++++++++++++++++++++++++++"
echo "Finish"
echo "+++++++++++++++++++++++++++++"
sudo reboot

