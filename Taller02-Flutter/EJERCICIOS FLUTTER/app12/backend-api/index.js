const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '12345',
  database: 'dazzart'
});

db.connect(err => {
  if (err) {
    console.error('Error conectando a MySQL:', err);
    return;
  }
  console.log('Conectado a MySQL');
});


app.get('/usuarios', (req, res) => {
  db.query('SELECT * FROM usuario', (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

app.get('/usuarios/:id', (req, res) => {
  const { id } = req.params;
  db.query('SELECT * FROM usuario WHERE id_usuario = ?', [id], (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    if (results.length === 0) return res.status(404).json({ error: 'Usuario no encontrado' });
    res.json(results[0]);
  });
});

app.get('/categorias', (req, res) => {
  db.query('SELECT * FROM categoria', (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Servidor escuchando en http://localhost:${PORT}`);
});
