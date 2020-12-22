#!/bin/bash
#Configurar teclado padrão nacional
loadkeys br-abnt2 

#Gerar arquivos de linguagem
locale-gen

#Wifi
iwctl
device list
station dispositivo scan
station dispositivo get-networks
station dispositivo connect SSID
#Digitar senha se houver

#Exportar variavel com a linguagem 
export LANG=pt_BR.UTF-8

#DESCOBRIR TIPO BOOT, caso não ache o diretório, é BIOS, se não UEFI
ls /sys/firmware/efi/efivars

#VERIFICAR CONEXAO COM A INTERNET
ip link
ping www.google.com

#Atualizar relógio do sistema
timedatectl set-ntp true

####PARTIÇÕES
#Checar os discos
fdisk -l

#Formatar discos
cfdisk /dev/sdX -> X o hdd/sdd que vai usar

#Criar particoes na ferramenta (BIOS ROOT E SWAP)

#Formatar partições no formato correto
mkfs.ext4 /dev/sdXy -> ROOT
mkfs.fat -F32 /dev/sdXy -> EFI (BOOT)
mkswap /dev/sdXy -> SWAP

#Montar as partições
mount /dev/sdXy /mnt -> Montar o ROOT
mount /dev/sdXy /mnt/boot/efi -> Montar o EFI
swapon /dev/sdXy -> MONTAR O SWAP

#Instalar essencial
pacstrap /mnt base linux linux-firmware base-devel

#Gerar fstab
genfstab -U /mnt >> /mnt/etc/fstab

###Mudar para dentro do sistema###
arch-chroot /mnt
