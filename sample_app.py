import os
import pymysql
from flask import Flask

sample = Flask(__name__)

# Fallo 1 (Bandit - B105): Clave en texto plano (Hardcoded Password)
MYSQL_PASSWORD = "super_secret_123"

@sample.route("/")
def home():
    # Fallo 2 (Pytest): Devolvemos código 500 para forzar el fallo de la prueba unitaria
    return "Error provocado intencionalmente", 500

if __name__ == "__main__":
    # Fallo 3 (Bandit - B201): Modo Debug activado explícitamente y host abierto
    sample.run(host="0.0.0.0", port=5050, debug=True)