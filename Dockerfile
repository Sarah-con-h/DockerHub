FROM python:3.12-slim

WORKDIR /home/myapp

# Actualizar paquetes del sistema
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

# Limpiar instalaciones previas e instalar dependencias actualizadas ignorando paquetes del sistema base
RUN pip install --no-cache-dir --upgrade --ignore-installed pip "setuptools>=78.1.1" "msgpack>=1.2.1"

# Copiar e instalar requerimientos del proyecto
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el codigo fuente
COPY . .

EXPOSE 5050
CMD ["python3", "sample_app.py"]