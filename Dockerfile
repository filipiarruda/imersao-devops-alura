FROM python:3.10 as builder

# Define o diretório de trabalho
WORKDIR /app

# Cria um ambiente virtual para isolar as dependências
RUN python -m venv .
ENV PATH="/opt/venv/bin:$PATH"

# Copia o arquivo de requisitos e instala as dependências no venv
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expõe a porta que a aplicação irá rodar
EXPOSE 8000

# Comando para iniciar a aplicação com um servidor WSGI de produção (Gunicorn)
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]