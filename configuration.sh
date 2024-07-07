#!/bin/bash


# Configura atalhos de teclado


echo "Configurando atalhos"

# Alterar o atalho para lançar o terminal para Super+T
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Super>T']"
gsettings get org.gnome.settings-daemon.plugins.media-keys terminal


# Alterar o atalho para abrir a pasta pessoal para Super+E
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>E']"
gsettings get org.gnome.settings-daemon.plugins.media-keys home

echo "Reiniciando gnome-settings-daemon..."
killall gnome-settings-daemon
nohup gnome-settings-daemon &


echo "Configuração de atalhos concluida."

