#!/bin/bash

# Configuração Setup Dev Kit: Lucas da Silva Santos 09/06/2023

# Atualiza dependências
sudo apt update
sudo apt upgrade

# Instala dependências
sudo apt -y install git
sudo apt -y install curl
sudo apt -y install wget
sudo apt -y install python3
sudo apt -y install python3-pip
sudo apt -y install python3-venv

#instala nodejs
sudo apt -y install nodejs
sudo apt -y install npm


# Instala o Spotify
sudo snap install spotify

# Instala gnome-shell-extensions
sudo apt -y install gnome-shell-extensions

# Instala o Docker
sudo apt -y install docker.io
sudo apt -y install docker-compose

# Configura usuário docker para execução sem sudo
sudo groupadd docker
sudo usermod -aG docker $USER

# Instala o microk8s
sudo snap install microk8s --classic

# Instala o kubectl
sudo snap install kubectl --classic

# Instala o sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Instala o Java 17, o Gradle, Maven e quarkus mais recente com o sdkman
sdk install java
sdk install gradle
sdk install maven

# instala o quarkus com o sdkman
sdk install quarkus


# Instala o IntelliJ Ultimate
sudo snap install intellij-idea-ultimate --classic

# Instala o Postman
sudo snap install postman

# Instala o Visual Studio Code
sudo snap install code --classic

# Instala o Discord
sudo snap install discord

# Instala o Lens
curl -fsSL https://downloads.k8slens.dev/keys/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/lens-archive-keyring.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/lens-archive-keyring.gpg] https://downloads.k8slens.dev/apt/debian stable main" | sudo tee /etc/apt/sources.list.d/lens.list > /dev/null
sudo apt update
sudo apt -y install lens

# Atualiza o cache das fontes
fc-cache -f -v

# Altera o tema do terminal para MesloLGS NF Regular
sed -i 's/font = Monospace 10/font = MesloLGS NF 10/g' ~/.config/alacritty/alacritty.yml

# Altera a fonte do GNOME Terminal para MesloLGS NF Regular
sed -i 's/monospace/MesloLGS NF Regular/g' ~/.config/gtk-3.0/settings.ini

# Baixa e instala as fontes do Powerlevel10k
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
mv *.ttf /home/$USER/.fonts
fc-cache -f -v

echo "Atualização e instalação de dependências concluídas."
