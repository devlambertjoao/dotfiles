#!/bin/bash
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
mkdir -p /usr/share/fonts/truetype/firacode
sudo mv FiraCode.zip /usr/share/fonts/truetype/firacode/FiraCode.zip
cd /usr/share/fonts/truetype/firacode
sudo unzip FiraCode.zip
fc-cache -f -v
cd

