FROM python
WORKDIR /home/myapp
COPY requirements.txt .

# Actualiza pip y fuerza la instalación de versiones seguras para pasar el escaneo de Trivy
RUN pip install --no-cache-dir --upgrade pip "setuptools>=78.1.1" "msgpack>=1.2.1"
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
EXPOSE 5050
CMD ["python3", "sample_app.py"]