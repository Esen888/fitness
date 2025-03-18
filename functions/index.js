const functions = require("firebase-functions");
const cors = require("cors")({ origin: true });  // Разрешаем все домены

// Функция, которая использует CORS
exports.myApi = functions.https.onRequest((req, res) => {
  // Выполняем проверку CORS
  cors(req, res, () => {
    res.status(200).send("Hello from Firebase!");  // Ответ на запрос
  });
});
