#!/bin/bash

#Instalar o basico
pacman -Sy nano sudo dosfstools os-prober mtools grub-efi-x86_64 efibootmgr iwd pulseaudio alsa-utils xorg nvidia nvidia-libgl mesa
pacman -S dialog networkmanager netctl wireless_tools dhcpcd wpa_supplicant

#Instalar utilitarios
pacman -S
sudo pacman -S git curl neovim

#Problemas com wifi depois de instalar ? https://ostechnix.com/fix-job-netctl-service-failed-error-arch-linux/
# sudo ip link set wlan0 down
# sudo netctl start wlan0NET_5G38EC0A

systemctl enable netctl
systemctl enable dhcpcd
systemctl enable NetworkManager

#Setar fuso horário de Brasilia
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

#Sincronizar horas
hwclock --systohc

#Edite a linguagem do sistema, descomentando a linnha pt_BR.UTF8
echo en_US.UTF-8 UTF-8 > /etc/locale.gen

#Gerar os locales após
locale-gen

#Definir sua variavel linguagem, digite no arquivo LANG=pt_BR.UTF-8
echo LANG=en_US.UTF-8 > /etc/locale.conf 

#Persistir layout do teclado, digite no arquivo KEYMAP=br-abnt2
echo KEYMAP=br-abnt2 > /etc/vconsole.conf

#Crie o arquivo e defina seu hostname (colocar nome da maquina)
echo dev > /etc/hostname

#Definir hosts em /etc/hosts
echo "127.0.0.1 localhost.localdomain localhost" > /etc/hosts
echo "::1 localhost.localdomain localhost" >> /etc/hosts
echo "127.0.1.1	dev.localdomain dev" >> /etc/hosts

#Definir voce como um sudoer e adicionar como usuario 
useradd -m -g users -G wheel lambert
echo "lambert ALL=(ALL) ALL" >> /etc/sudoers

#Gerar um Initramfs
mkinitcpio -P

#Definir senha do root
clear
echo "Digite a senha do root"
passwd

#Definir a senha da sua conta
clear
echo "Digite a senha do usuario lambert"
passwd lambert

#Configurar grub
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch --recheck

cp /usr/share/locale/en@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

nano /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg
