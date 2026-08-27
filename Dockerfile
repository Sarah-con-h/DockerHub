FROM python:3.12-slim

WORKDIR /home/myapp

# Actualizar herramientas base e instalar requerimientos
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip "setuptools>=78.1.1" "msgpack>=1.2.1"
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código del proyecto
COPY . .

EXPOSE 5050
CMD ["python3", "sample_app.py"]