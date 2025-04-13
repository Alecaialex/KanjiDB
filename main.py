# IMPORTAR LIBRERÍAS
from flask import Flask, request
from flask_cors import CORS
from JGVutils import SQLiteConnection

# CONFIGURAR APLICACIÓN
application = Flask(__name__)
cors = CORS(application)
application.config["CORS_HEADERS"] = "Content-Type"


# Página principal
@application.route("/", methods=["GET"])
def index():
    return ""

# Obtener todo
@application.route("/all", methods=["GET"])
def all():
    conexion = SQLiteConnection("db/kanji.db")
    respuesta = conexion.execute_query("SELECT kanji, tipo, onyomi, kunyomi, significado, frase, traduccion, nivel_jlpt FROM kanjis k INNER JOIN frases f ON f.kanji_id = k.id INNER JOIN niveles_jlpt j ON j.kanji_id = k.id;")
    return respuesta