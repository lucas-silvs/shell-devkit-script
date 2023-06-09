#!/bin/bash

# Script principal que chama os outros scripts

# Executa o script para atualizar e instalar dependências
./atualiza_instala_dependencias.sh

# Executa o script para instalar o Zsh
./instala_zsh.sh

echo "Configuração Setup Dev Kit concluída."
