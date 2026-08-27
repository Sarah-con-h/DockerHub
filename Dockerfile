FROM python:3.12-slim

WORKDIR /home/myapp

# Actualizar paquetes del sistema operativo base
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

# Actualizar paquetes globales instalados en /usr/local/
RUN pip install --no-cache-dir --upgrade pip "setuptools>=78.1.1" "msgpack>=1.2.1"

# Crear y activar el entorno virtual aislado
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Actualizar los paquetes dentro del entorno virtual
RUN pip install --no-cache-dir --upgrade pip "setuptools>=78.1.1" "msgpack>=1.2.1"

# Copiar e instalar dependencias del proyecto
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código fuente
COPY . .

EXPOSE 5050
CMD ["python3", "sample_app.py"]