#!/bin/bash

# Arquivos de entrada e saída
INPUT_FILE="entrada.csv"      # Arquivo CSV de entrada
OUTPUT_FILE="resultado.csv"   # Arquivo CSV com resultados
LOG_FILE="log_teste.txt"      # Arquivo de log dos testes

# Limpar arquivos de saída
> "$OUTPUT_FILE"
> "$LOG_FILE"

# Cabeçalho para o arquivo de saída
echo "Host,Status" >> "$OUTPUT_FILE"

# Ler o arquivo de entrada linha por linha
while IFS=',' read -r host; do
    if [[ "$host" == "Host" ]]; then
        # Ignorar o cabeçalho do arquivo CSV
        continue
    fi

    echo "Testando conexão com $host..."
    
    # Executar o comando OpenSSL
    if openssl s_client -connect "$host" </dev/null 2>/dev/null | grep -q "Verify return code: 0"; then
        echo "$host,Success" >> "$OUTPUT_FILE"
        echo "Conexão bem-sucedida com $host" >> "$LOG_FILE"
    else
        echo "$host,Failure" >> "$OUTPUT_FILE"
        echo "Falha na conexão com $host" >> "$LOG_FILE"
    fi
done < "$INPUT_FILE"

echo "Testes concluídos. Resultados em $OUTPUT_FILE e detalhes em $LOG_FILE."
