#!/bin/bash
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
sudo mkdir -p ~/.fonts
sudo mv FiraCode.zip ~/.fonts/FiraCode.zip
cd ~/.fonts
sudo unzip FiraCode.zip
fc-cache -f -v
cd

