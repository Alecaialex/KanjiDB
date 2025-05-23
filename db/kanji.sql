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
('見', 'verbo transitivo', 'ケン', 'み.る', 'ver'),
('鶏', 'sustantivo', 'ケイ', 'にわとり', 'pollo'),
('牛', 'sustantivo', 'ギュウ', 'うし', 'vaca'),
('馬', 'sustantivo', 'バ', 'うま', 'caballo'),
('魚', 'sustantivo', 'ギョ, リョウ', 'さかな, うお', 'pez'),
('豚', 'sustantivo', 'トン, ブタ', 'ぶた', 'cerdo'),
('鬱', 'sustantivo', 'ウツ', 'うつ', 'depresión'),
('応', 'verbo transitivo', 'オウ', 'おう.じる, よ.く', 'responder'),
('数', 'sustantivo', 'スウ, ス', 'かず, かぞ.える', 'número'),
('分', 'sustantivo', 'ブン, フン, ブ', 'わ.ける, わ.かる', 'parte, minuto'),
('時', 'sustantivo', 'ジ', 'とき, ときどき', 'hora, tiempo'),
('間', 'sustantivo', 'カン, ケン', 'あいだ, ま', 'intervalo, espacio');

INSERT INTO niveles_jlpt (kanji_id, nivel_jlpt) VALUES
(1, 'N5'),
(2, 'N5'),
(3, 'N5'),
(4, 'N4'),
(5, 'N5'),
(6, 'N4'),
(7, 'N4'),
(8, 'N4'),
(9, 'N4'),
(10, 'N4'),
(11, 'N2'),
(12, 'N1'),
(13, 'N1'),
(14, 'N3'),
(15, 'N1');

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
(5, '私はそれを見逃しました。', 'Me lo perdí.'),
(6, '鶏肉は健康に良いです。', 'El pollo es bueno para la salud.'),
(6, '鶏が鳴いています。', 'El gallo está cantando.'),
(6, 'この料理には鶏肉が入っています。', 'Este plato lleva pollo.'),
(6, '鶏の卵は栄養価が高いです。', 'Los huevos de gallina son muy nutritivos.'),
(6, '鶏を育てるのが好きです。', 'Me gusta criar gallinas.'),
(7, '牛乳を飲みます。', 'Bebo leche.'),
(7, '牛は草を食べています。', 'La vaca está comiendo hierba.'),
(7, '牛肉は美味しいです。', 'La carne de res es deliciosa.'),
(7, '牛の世話をしています。', 'Estoy cuidando a la vaca.'),
(7, '牛は大きな動物です。', 'La vaca es un animal grande.'),
(8, '馬に乗るのが好きです。', 'Me gusta montar a caballo.'),
(8, '競馬を見に行きました。', 'Fui a ver una carrera de caballos.'),
(8, '馬は速く走ります。', 'El caballo corre rápido.'),
(8, 'この馬はとても大きいです。', 'Este caballo es muy grande.'),
(8, '馬小屋で馬を飼っています。', 'Tengo un caballo en el establo.'),
(9, '魚を釣りました。', 'Pesqué un pez.'),
(9, '魚料理が好きです。', 'Me gusta la comida de pescado.'),
(9, '海で魚を見ました。', 'Vi peces en el mar.'),
(9, '新鮮な魚を買いました。', 'Compré pescado fresco.'),
(9, '魚市場に行きました。', 'Fui al mercado de pescado.'),
(10, '豚肉が好きです。', 'Me gusta la carne de cerdo.'),
(10, '豚は可愛い動物です。', 'El cerdo es un animal lindo.'),
(11, '鬱病の治療を受けています。', 'Estoy recibiendo tratamiento para la depresión.'),
(11, '鬱な気分が続いています。', 'Me siento deprimido.'),
(11, '鬱の症状が改善しました。', 'Los síntomas de la depresión han mejorado.'),
(11, '鬱の時は、友達と話すといいです。', 'Cuando estoy deprimido, es bueno hablar con amigos.'),
(11, '鬱を克服するために努力しています。', 'Estoy esforzándome por superar la depresión.'),
(12, '応援しています。', 'Te apoyo.'),
(12, '彼は私の応援を必要としています。', 'Él necesita mi apoyo.'),
(12, '応答がありません。', 'No hay respuesta.'),
(12, '応急処置を学びました。', 'Aprendí primeros auxilios.'),
(12, '応じることが大切です。', 'Es importante responder.'),
(13, '数を数えます。', 'Cuento los números.'),
(13, '彼は数が得意です。', 'Él es bueno con los números.'),
(13, '数が多いです。', 'Hay muchos números.'),
(13, '数を増やすことができます。', 'Puedo aumentar el número.'),
(13, '数え方を教えてください。', 'Por favor, enséñame a contar.'),
(14, '時間を守ります。', 'Cumplo con el tiempo.'),
(14, '時間がないです。', 'No tengo tiempo.'),
(14, '時間を無駄にしないでください。', 'No pierdas el tiempo.'),
(14, '時間が経つのが早いです。', 'El tiempo pasa rápido.'),
(14, '時間を大切にしましょう。', 'Valoremos el tiempo.'),
(15, '間違いを訂正します。', 'Corrijo el error.'),
(15, '間に合いました。', 'Llegué a tiempo.'),
(15, '間隔を空けてください。', 'Por favor, mantén la distancia.'),
(15, '間違いなくそうです。', 'Sin duda es así.'),
(15, '間に合うように急ぎます。', 'Me apresuraré para llegar a tiempo.');
