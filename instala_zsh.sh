#!/bin/bash

# Verifica se o dbus-launch está instalado e instala se necessário
if ! command -v dbus-launch &> /dev/null; then
    echo "O pacote dbus-x11 não está instalado. Instalando..."
    sudo apt update
    sudo apt install -y dbus-x11
fi

# Baixa e instala as fontes do Powerlevel10k
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
mkdir -p ~/.local/share/fonts
mv *.ttf ~/.local/share/fonts
fc-cache -f -v

# Inicia uma sessão D-Bus, se necessário
if [[ -z "$DBUS_SESSION_BUS_ADDRESS" ]]; then
    eval "$(dbus-launch --sh-syntax)"
    DBUS_SESSION_LAUNCHED=1
fi

# Obtém o ID do perfil padrão do GNOME Terminal
PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")

# Desativa a opção de usar a fonte do sistema
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/Terminal/Legacy/Profiles:/:$PROFILE_ID/" use-system-font false

# Altera a fonte do GNOME Terminal para MesloLGS NF Regular
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/Terminal/Legacy/Profiles:/:$PROFILE_ID/" font 'MesloLGS NF 12'

# Verifica se a configuração foi aplicada
gsettings get "org.gnome.Terminal.Legacy.Profile:/org/gnome/Terminal/Legacy/Profiles:/:$PROFILE_ID/" font

# Finaliza a sessão D-Bus, se necessário
if [[ -n "$DBUS_SESSION_LAUNCHED" ]]; then
    kill "$DBUS_SESSION_BUS_PID"
fi





# Instala o Zsh
sudo apt -y install zsh

# Instala o Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instala o Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-/home/$USER/.oh-my-zsh/custom}/themes/powerlevel10k

# Instala o plugin zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-/home/$USER/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Instala o plugin zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/home/$USER/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Altera o tema do terminal para Powerlevel10k e adiciona plugins no arquivo .zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' /home/$USER/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' /home/$USER/.zshrc

echo "Instalação do Zsh concluída."
