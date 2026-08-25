FROM python
WORKDIR /home/myapp

COPY requirements.txt .

# Actualizar pip y desinstalar/reinstalar versiones seguras explícitamente
RUN pip install --no-cache-dir --upgrade pip "setuptools>=78.1.1" "msgpack>=1.2.1"
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código fuente ignorando venv mediante .dockerignore
COPY . .

EXPOSE 5050
CMD ["python3", "sample_app.py"]