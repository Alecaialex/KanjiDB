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

    if (kanji is None or kanji == ""):
        return "No se ha pasado un kanji"
    if (len(kanji) > 1):
        return "El kanji debe ser un solo carácter"
    
    conexion = SQLiteConnection("db/kanji.db")
    info_kanji = conexion.execute_query("SELECT kanji, tipo, onyomi, kunyomi, significado, nivel_jlpt FROM kanjis INNER JOIN niveles_jlpt ON kanji_id = id WHERE kanji = ?;", (kanji))
    frases = conexion.execute_query("SELECT frase, traduccion FROM frases WHERE kanji_id = (SELECT id FROM kanjis WHERE kanji = ?);", (kanji))
    respuesta = {
        "kanji_info": info_kanji,
        "frases": frases
    }
    return respuesta

# Obtener todos los kanjis de un nivel
@application.route("/nivel", methods=["GET"])
def nivel():
    nivel = request.args.get("nivel")

    if (nivel is None or nivel == ""):
        return "No se ha pasado un nivel"
    if (len(nivel) != 2):
        return "El nivel deben ser 2 carácteres"
    
    conexion = SQLiteConnection("db/kanji.db")
    respuesta = conexion.execute_query("SELECT kanji, tipo, onyomi, kunyomi, significado FROM kanjis k INNER JOIN niveles_jlpt j ON j.kanji_id = k.id WHERE nivel_jlpt = ?;", (nivel,))
    return respuesta

# Eliminar un kanji y toda su información asociada
@application.route("/eliminar", methods=["DELETE"])
def eliminar():
    kanji = request.args.get("kanji")

    if (kanji is None or kanji == ""):
        return "No se ha pasado un kanji"
    if (len(kanji) > 1):
        return "El kanji debe ser un solo carácter"

    conexion = SQLiteConnection("db/kanji.db")
    kanji_existe = conexion.execute_query("SELECT id FROM kanjis WHERE kanji = ?;", (kanji))
    if not kanji_existe:
        return "El kanji no existe en la base de datos"
    conexion.execute_query("DELETE FROM frases WHERE kanji_id = (SELECT id FROM kanjis WHERE kanji = ?);", (kanji), commit=True)
    conexion.execute_query("DELETE FROM niveles_jlpt WHERE kanji_id = (SELECT id FROM kanjis WHERE kanji = ?);", (kanji), commit=True)
    conexion.execute_query("DELETE FROM kanjis WHERE kanji = ?;", (kanji), commit=True)
    return "Kanji eliminado correctamente"

# Añadir un kanji junto a su información asociada
@application.route("/add", methods=["POST"])
def add():
    kanji = request.form.get("kanji")
    tipo = request.form.get("tipo")
    onyomi = request.form.get("onyomi")
    kunyomi = request.form.get("kunyomi")
    significado = request.form.get("significado")
    frase = request.form.get("frase")
    traduccion = request.form.get("traduccion")
    nivel_jlpt = request.form.get("nivel_jlpt")

    conexion = SQLiteConnection("db/kanji.db")
    conexion.execute_query("INSERT OR IGNORE INTO kanjis (kanji, tipo, onyomi, kunyomi, significado) VALUES (?, ?, ?, ?, ?);", (kanji, tipo, onyomi, kunyomi, significado), commit=True)
    kanji_id = conexion.execute_query("SELECT id FROM kanjis WHERE kanji = ?;", (kanji,))[0][0]
    conexion.execute_query("INSERT OR IGNORE INTO frases (frase, traduccion, kanji_id) VALUES (?, ?, ?);", (frase, traduccion, kanji_id), commit=True)
    conexion.execute_query("INSERT OR IGNORE INTO niveles_jlpt (nivel_jlpt, kanji_id) VALUES (?, ?);", (nivel_jlpt, kanji_id), commit=True)
    return "Kanji añadido correctamente"