#!/bin/bash


# Configura atalhos de teclado

# Configura atalho para abrir pasta pessoal precionando as teclas: Super + E
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"

# Configura atalho para abrir o terminal precionando as teclas: Super + T
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Super>t']"

# Configura atalho para ir para a area de trabalho a direita precionando as teclas: Super + D
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>d']"

# Configura atalho para ir para a area de trabalho a esquerda precionando as teclas: Super + A
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>a']"

# Configura atalho para enviar a janela de trabalho para a direita precionando as teclas: Super + Shift + D
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Super><Shift>d']"

# Configura atalho para enviar a janela de trabalho para a esquerda precionando as teclas: Super + Shift + A
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>a']"
