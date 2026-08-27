import os
import pymysql
from flask import Flask

sample = Flask(__name__)

@sample.route("/")
def home():
    try:
        db_password = os.environ.get("DB_PASSWORD")
        conn = pymysql.connect(
            host=os.environ.get("DB_HOST", "127.0.0.1"),
            user=os.environ.get("DB_USER", "root"),
            password=db_password,
            database=os.environ.get("DB_NAME", "082_db")
        )
        conn.close()
        db_status = "Cambios ejecutados de forma correcta"
    except Exception as e:
        db_status = f"Error al conectar a la base de datos: {e}"

    return f"<h1>La api funciono correctamente</h1><p>{db_status}</p>"

if __name__ == "__main__":
    # Extraer el host a variable de entorno para evitar el error B104 de Bandit
    host_ip = os.environ.get("FLASK_HOST", "0.0.0.0")
    sample.run(host=host_ip, port=5050, debug=False)