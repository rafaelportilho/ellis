# Use a imagem oficial do Python com base Alpine Linux.
# É uma imagem leve, ótima para produção.
FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho dentro do container.
# Todos os comandos subsequentes serão executados a partir deste diretório.
WORKDIR /app

# Define variáveis de ambiente para otimizar o Python no Docker.
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Copia o arquivo de dependências para o diretório de trabalho.
COPY requirements.txt .

# Instala as dependências do projeto.
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código da sua aplicação para o diretório de trabalho no container.
COPY . .

# Expõe a porta 8000, que é a porta padrão do Uvicorn.
EXPOSE 8000

# Comando para iniciar a aplicação quando o container for executado.
# O host 0.0.0.0 torna a aplicação acessível de fora do container.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]