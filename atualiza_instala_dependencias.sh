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
sudo apt -y install gnome-shell-extensions
sudo apt -y install docker.io
sudo apt -y install docker-compose

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
sudo apt update
sudo apt install -y gcc g++ yarn
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt install -y ./discord.deb
rm discord.deb

# Configura usuário docker para execução sem sudo
sudo groupadd docker
sudo usermod -aG docker $USER

# Instala o Spotify
sudo snap install spotify
sudo snap install dbeaver-ce
sudo snap install microk8s --classic
sudo snap install kubectl --classic
sudo snap install intellij-idea-ultimate --classic
sudo snap install postman
sudo snap install code --classic



# Instala o sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Instala o Java 17, o Gradle, Maven e quarkus mais recente com o sdkman
sdk install java
sdk install gradle
sdk install maven
sdk install quarkus

# Instala o Lens
curl -fsSL https://downloads.k8slens.dev/keys/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/lens-archive-keyring.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/lens-archive-keyring.gpg] https://downloads.k8slens.dev/apt/debian stable main" | sudo tee /etc/apt/sources.list.d/lens.list > /dev/null
sudo apt update
sudo apt -y install lens

# Baixa e instala as fontes do Powerlevel10k
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
mv *.ttf /home/$USER/.fonts
fc-cache -f -v

# Altera o tema do terminal para MesloLGS NF Regular
sed -i 's/font = Monospace 10/font = MesloLGS NF 10/g' ~/.config/alacritty/alacritty.yml

# Altera a fonte do GNOME Terminal para MesloLGS NF Regular
sed -i 's/monospace/MesloLGS NF Regular/g' ~/.config/gtk-3.0/settings.ini


echo "Atualização e instalação de dependências concluídas."
