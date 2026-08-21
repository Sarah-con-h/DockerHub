import pymysql
from flask import Flask

sample = Flask(__name__)

@sample.route("/")
def home():
    try:
        conn = pymysql.connect(host='servidor-bd-ejemplo', user='root', password='sena123', database='082_db')
        conn.close()
        db_status = "Conexión exitosa a la base de datos, prueba para CI/CD para despliegue continuo"
    except Exception as e:
        db_status = f"Error al conectar a la base de datos: {e}"

    return f"<h1>Bienvenido a mi aplicación Flask</h1><p>{db_status}</p>"

if __name__ == "__main__":
    sample.run(host='0.0.0.0', port=5050, debug=True)