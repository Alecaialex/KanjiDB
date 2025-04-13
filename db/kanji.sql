CREATE TABLE IF NOT EXISTS kanjis (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    kanji CHAR(1) NOT NULL,
    tipo TEXT,
    onyomi TEXT,
    kunyomi TEXT,
    significado TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS niveles_jlpt (
    kanji_id INTEGER PRIMARY KEY,
    nivel_jlpt TEXT,
    FOREIGN KEY (kanji_id) REFERENCES kanjis(id)
);

CREATE TABLE IF NOT EXISTS frases (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    kanji_id INTEGER NOT NULL,
    frase TEXT NOT NULL,
    traduccion TEXT NOT NULL,
    FOREIGN KEY (kanji_id) REFERENCES kanjis(id)
);

INSERT INTO kanjis (kanji, tipo, onyomi, kunyomi, significado) VALUES
('食', 'verbo transitivo', 'ショク', 'た.べる', 'comer'),
('走', 'verbo intransitivo', 'ソウ', 'はし.る', 'correr'),
('高', 'adjetivo i', 'コウ', 'たか.い', 'alto, caro'),
('静', 'adjetivo na', 'セイ, ジョウ', 'しず.か', 'tranquilo'),
('見', 'verbo transitivo', 'ケン', 'み.る', 'ver');

INSERT INTO niveles_jlpt (kanji_id, nivel_jlpt) VALUES
(1, 'N5'),
(2, 'N5'),
(3, 'N5'),
(4, 'N4'),
(5, 'N5');

INSERT INTO frases (kanji_id, frase, traduccion) VALUES
(1, '私は毎日パンを食べます。', 'Como pan todos los días.'),
(1, '昨日はラーメンを食べました。', 'Ayer comí ramen.'),
(1, 'このレストランで寿司を食べたいです。', 'Quiero comer sushi en este restaurante.'),
(1, '母は毎朝、私に朝ごはんを作ります。', 'Mi madre me prepara el desayuno cada mañana.'),
(1, 'ダイエット中なので、あまり食べないようにしています。', 'Estoy a dieta, así que trato de no comer mucho.'),
(2, '彼は公園で走っています。', 'Él está corriendo en el parque.'),
(2, '毎朝、ジョギングをしています。', 'Hago jogging todas las mañanas.'),
(2, '私の友達はマラソンを走ったことがあります。', 'Mi amigo ha corrido una maratón.'),
(2, '道路で走らないでください。', 'No corras en la carretera.'),
(2, '早く走らなければ、バスに乗り遅れます。', 'Si no corro rápido, perderé el autobús.'),
(3, 'このビルはとても高いです。', 'Este edificio es muy alto.'),
(3, '高い山に登るのが好きです。', 'Me gusta escalar montañas altas.'),
(3, '物価が高いので、節約しています。', 'Los precios son altos, así que estoy ahorrando.'),
(3, '彼は高い声で話します。', 'Él habla con una voz alta.'),
(3, 'このホテルは高級なサービスを提供しています。', 'Este hotel ofrece un servicio de lujo.'),
(4, '静かな場所が好きです。', 'Me gustan los lugares tranquilos.'),
(4, '公園は静かで、リラックスできます。', 'El parque es tranquilo y puedes relajarte.'),
(4, '夜は静かにしてください。', 'Por favor, mantén silencio por la noche.'),
(4, '静かな海で泳ぎたいです。', 'Quiero nadar en un mar tranquilo.'),
(4, '静かにして、音楽を聴いています。', 'Estoy escuchando música en silencio.'),
(5, '映画を見ました。', 'Vi una película.'),
(5, 'テレビでニュースを見ています。', 'Estoy viendo las noticias en la televisión.'),
(5, '彼女は美しい景色を見ました。', 'Ella vio un paisaje hermoso.'),
(5, '本を見つけたら教えてください。', 'Por favor, avísame cuando encuentres el libro.'),
(5, '私はそれを見逃しました。', 'Me lo perdí.');