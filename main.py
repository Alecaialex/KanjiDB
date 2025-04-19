# IMPORTAR LIBRERÍAS
from flask import Flask, request,render_template
from flask_cors import CORS
from JGVutils import SQLiteConnection

# CONFIGURAR APLICACIÓN
application = Flask(__name__)
cors = CORS(application)
application.config["CORS_HEADERS"] = "Content-Type"


# Página principal
@application.route("/", methods=["GET"])
def index():
    return render_template('index.html')

# Obtener todo
@application.route("/all", methods=["GET"])
def all():
    conexion = SQLiteConnection("db/kanji.db")
    respuesta = conexion.execute_query("SELECT kanji, tipo, onyomi, kunyomi, significado, frase, traduccion, nivel_jlpt FROM kanjis k INNER JOIN frases f ON f.kanji_id = k.id INNER JOIN niveles_jlpt j ON j.kanji_id = k.id;")
    return respuesta

# Obtener todo de un kanji
@application.route("/kanji", methods=["GET"])
def buscador():
    kanji = request.args.get("kanji")

    if kanji is None or kanji == "":
        return "No se ha pasado un kanji"
    if len(kanji) > 1:
        return "El kanji debe ser un solo carácter"
    
    conexion = SQLiteConnection("db/kanji.db")
    info_kanji = conexion.execute_query("SELECT kanji, tipo, onyomi, kunyomi, significado, nivel_jlpt FROM kanjis INNER JOIN niveles_jlpt ON kanji_id = id WHERE kanji = ?;", (kanji))
    frases = conexion.execute_query("SELECT frase, traduccion FROM frases WHERE kanji_id = (SELECT id FROM kanjis WHERE kanji = ?);", (kanji))
    respuesta = {
        "kanji_info": info_kanji,
        "frases": frases
    }
    return respuesta