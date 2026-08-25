import os
import pymysql
from flask import Flask

sample = Flask(__name__)

@sample.route("/")
def home():
    try:
        # Extrae la contraseña desde variables de entorno; usa fallback solo en local si no existe
        db_password = os.environ.get("DB_PASSWORD", "sena123")
        conn = pymysql.connect(
            host='servidor-bd-ejemplo', 
            user='root', 
            password=db_password, 
            database='082_db'
        )
        conn.close()
        db_status = "Cambios ejecutados de forma correcta"
    except Exception as e:
        db_status = f"Error al conectar a la base de datos: {e}"

    return f"<h1>La api funciono correctamente</h1><p>{db_status}</p>"

if __name__ == "__main__":
    # Lee configuración desde el entorno: por defecto no expone la app ni activa debug
    is_debug = os.environ.get("FLASK_DEBUG", "False").lower() == "true"
    host_ip = os.environ.get("FLASK_HOST", "127.0.0.1")
    
    sample.run(host=host_ip, port=5050, debug=is_debug)