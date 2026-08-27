FROM python:3.12-slim

WORKDIR /home/myapp

# 1. Actualizar el sistema base Debian
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

# 2. Forzar actualización global de pip, setuptools y msgpack
RUN pip install --no-cache-dir --upgrade pip "setuptools>=78.1.1" "msgpack>=1.2.1"

# 3. Crear el entorno virtual sin heredar paquetes del sistema
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# 4. Copiar e instalar dependencias actualizadas
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip "setuptools>=78.1.1" "msgpack>=1.2.1" \
    && pip install --no-cache-dir -r requirements.txt

# 5. Copiar código fuente
COPY . .

EXPOSE 5050
CMD ["python3", "sample_app.py"]