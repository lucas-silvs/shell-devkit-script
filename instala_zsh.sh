#!/bin/bash

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
