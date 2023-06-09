#!/bin/bash

# Configuração Setup Dev Kit: Lucas da Silva Santos 09/06/2023

# Função para executar comandos com sudo apenas uma vez
run_with_sudo() {
    if [ -z "$SUDO_EXECUTED" ]; then
        sudo -E "$@"
        SUDO_EXECUTED=true
    else
        "$@"
    fi
}

# atualiza dependencias
run_with_sudo apt update
run_with_sudo apt upgrade

# instala dependencias
run_with_sudo apt -y install git
run_with_sudo apt -y install curl
run_with_sudo apt -y install wget
run_with_sudo apt -y install python3
run_with_sudo apt -y install python3-pip
run_with_sudo apt -y install python3-venv

# instala o spotify
run_with_sudo snap install spotify

#instala gnome-shell-extensions
run_with_sudo apt -y install gnome-shell-extensions

# instala o docker
run_with_sudo apt -y install docker.io
run_with_sudo apt -y install docker-compose

# configura usuario docker para execução sem sudo
run_with_sudo groupadd docker
run_with_sudo usermod -aG docker "$USER"

# instala o microk8s
run_with_sudo snap install microk8s --classic

# instala o kubectl
run_with_sudo snap install kubectl --classic

# instala o sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# instala o Java 17, o gradle mais recente e o mais recente maven com o sdkman
run_with_sudo sdk install java
run_with_sudo sdk install gradle
run_with_sudo sdk install maven

#instala o intellij ultimate
run_with_sudo snap install intellij-idea-ultimate --classic

# instala o postman
run_with_sudo snap install postman

# istala o visual code
run_with_sudo snap install code --classic

# instala o discord
run_with_sudo snap install discord

# instala o lens
run_with_sudo curl -fsSL https://downloads.k8slens.dev/keys/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/lens-archive-keyring.gpg > /dev/null
run_with_sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/lens-archive-keyring.gpg] https://downloads.k8slens.dev/apt/debian stable main" | sudo tee /etc/apt/sources.list.d/lens.list > /dev/null
run_with_sudo apt update
run_with_sudo apt -y install lens



# -------------------------------- Configura ZSH --------------------------------

# instala zsh
run_with_sudo apt -y install zsh

# baixa e instala as fontes
# MesloLGS NF Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf

# MEslogLGS NF Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf

# MesloLGS NF Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf

# MesloLGS NF Bold Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# #instala as fontes para utilização no terminal
run_with_sudo mv *.ttf /home/"$USER"/.fonts

# atualiza o cache das fontes
fc-cache -f -v

# altera o tema do terminal para MesloLGS NF Regular
sed -i 's/font = Monospace 10/font = MesloLGS NF 10/g' ~/.config/alacritty/alacritty.yml

# altera fonte do gnome terminal para MesloLGS NF Regular
sed -i 's/monospace/MesloLGS NF Regular/g' ~/.config/gtk-3.0/settings.ini

# instala o oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# instala o powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-/home/$USER/.oh-my-zsh/custom}/themes/powerlevel10k

# instala o plugin zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# instala o plugin zsh-syntax-highlighting\
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# define zs como shell padrão
run_with_sudo chsh -s "$(which zsh)" "$USER"

# Altera o tema do terminal para Powerlevel10k e adiciona plugins no arquivo .zshrc
ZSHRC_FILE="/home/$USER/.zshrc"
if [ -f "$ZSHRC_FILE" ]; then
    # Altera o tema do terminal para Powerlevel10k no arquivo .zshrc
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$ZSHRC_FILE"

    # Altera o arquivo .zshrc para incluir os plugins
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' "$ZSHRC_FILE"

    # Reinicia o terminal ou recarrega o arquivo .zshrc
    source "$ZSHRC_FILE"
fi
