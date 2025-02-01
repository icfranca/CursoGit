# Use a imagem base Python
FROM python:3.12-slim-bookworm

# Copie o conteúdo do diretório atual para o diretório /app no contêiner
COPY . /app

# Defina o diretório de trabalho como /app
WORKDIR /app

# Exponha a porta 8000
EXPOSE 8000

# Comando para iniciar o servidor HTTP
CMD ["python", "-m", "http.server", "8000"]