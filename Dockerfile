# Use uma Imagem Official do Python
FROM python:rc-slim

# Declarando a váriavel do nome do arquivo de configuração do NewRelic
#ENV NEW_RELIC_CONFIG_FILE=newrelic.ini  NEW_RELIC_LICENSE_KEY=licensekey

#ENV CLOUD_SQL_USERNAME=   

# Definindo o diretório onde a aplicação será armazenada
WORKDIR /app

# Copiar os arquivos da pasta local para dentro do container
COPY . /app

# Instalar as dependências de Python de acordo com o que foi desenvolvido na aplicação e que está declarado no arquivo requirements.txt.
RUN pip install --trusted-host pypi.python.org -r requirements.txt

ENV PORT 8080
ENV HOST 0.0.0.0
EXPOSE 8080

# Garante que será iniciado a aplicação.
CMD ["run-program", "gunicorn", "app:app"]