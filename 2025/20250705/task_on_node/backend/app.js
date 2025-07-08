const express = require('express');
const path = require('path');
const app = express();

// 静的ファイルを提供するための設定
app.use(express.static(path.join(__dirname, 'public')));
app.use('/node_modules', express.static(path.join(__dirname, 'node_modules')));

// ルートパスにアクセスされた際にHTMLファイルを返す
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.get('/next', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'show.html'));
});

// サーバーのポートを指定
const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`サーバーがポート${PORT}で起動しました`);
});
