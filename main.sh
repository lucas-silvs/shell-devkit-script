#!/bin/bash

# Script principal que chama os outros scripts


#Ativa super user
echo "digite a senha do teu usuario para super user:"
sudo -v

# Executa o script para atualizar e instalar dependências
./atualiza_instala_dependencias.sh

read -p "Deseja instalar o ZSH? (Digite 'y' para confirmar): " resposta

# Verifica a resposta
if [ "$resposta" = "y" ]; then

    # Executa o script para instalar o Zsh
    ./instala_zsh.sh
    # Executa o script de configuração
    ./configuration.sh
fi


echo "Configuração Setup Dev Kit concluída."
