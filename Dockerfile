FROM python:3.12-slim

WORKDIR /home/myapp

# 1. Actualizar librerías del sistema base (corrige CVE-2026-14456 en OpenSSL)
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

# 2. Desinstalar versiones vulnerables previas e instalar las seguras desde cero
RUN pip uninstall -y setuptools msgpack \
    && pip install --no-cache-dir --upgrade pip "setuptools>=78.1.1" "msgpack>=1.2.1"

# 3. Copiar e instalar dependencias del proyecto
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copiar el código del proyecto
COPY . .

EXPOSE 5050
CMD ["python3", "sample_app.py"]