const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// Conexión a la base de datos
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '12345',
  database: 'dazzart'
});

db.connect(err => {
  if (err) {
    console.error('Error conectando a MySQL:', err);
    process.exit(1); // salir si no conecta
  }
  console.log('Conectado a MySQL');
});

// ----- CRUD Subcategorías -----

// Obtener todas las subcategorías con nombre de categoría
app.get('/subcategorias', (req, res) => {
  const sql = `
    SELECT s.*, c.nombre_categoria
    FROM subcategoria s
    JOIN categoria c ON s.id_categoria = c.id_categoria
  `;
  db.query(sql, (err, results) => {
    if (err) {
      console.error('Error al obtener subcategorias:', err);
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
});

// Obtener subcategoría por ID
app.get('/subcategorias/:id', (req, res) => {
  const { id } = req.params;
  const sql = 'SELECT * FROM subcategoria WHERE id_subcategoria = ?';
  db.query(sql, [id], (err, results) => {
    if (err) {
      console.error('Error al obtener subcategoria por ID:', err);
      return res.status(500).json({ error: err.message });
    }
    if (results.length === 0) {
      return res.status(404).json({ error: 'Subcategoría no encontrada' });
    }
    res.json(results[0]);
  });
});

// Crear subcategoría
app.post('/subcategorias', (req, res) => {
  const { nombre_subcategoria, descripcion_subcategoria, id_categoria } = req.body;
  const sql = 'INSERT INTO subcategoria (nombre_subcategoria, descripcion_subcategoria, id_categoria) VALUES (?, ?, ?)';
  db.query(sql, [nombre_subcategoria, descripcion_subcategoria, id_categoria], (err, result) => {
    if (err) {
      console.error('Error al crear subcategoria:', err);
      return res.status(500).json({ error: err.message });
    }
    res.status(201).json({ message: 'Subcategoría creada', id: result.insertId });
  });
});

// Actualizar subcategoría
app.put('/subcategorias/:id', (req, res) => {
  const { id } = req.params;
  const { nombre_subcategoria, descripcion_subcategoria, id_categoria } = req.body;
  const sql = 'UPDATE subcategoria SET nombre_subcategoria = ?, descripcion_subcategoria = ?, id_categoria = ? WHERE id_subcategoria = ?';
  db.query(sql, [nombre_subcategoria, descripcion_subcategoria, id_categoria, id], (err, result) => {
    if (err) {
      console.error('Error al actualizar subcategoria:', err);
      return res.status(500).json({ error: err.message });
    }
    res.json({ message: 'Subcategoría actualizada' });
  });
});

// Eliminar subcategoría
app.delete('/subcategorias/:id', (req, res) => {
  const { id } = req.params;
  const sql = 'DELETE FROM subcategoria WHERE id_subcategoria = ?';
  db.query(sql, [id], (err, result) => {
    if (err) {
      console.error('Error al eliminar subcategoria:', err);
      return res.status(500).json({ error: err.message });
    }
    res.json({ message: 'Subcategoría eliminada correctamente' });
  });
});

// ----- CRUD Categorías -----

app.get('/categorias', (req, res) => {
  db.query('SELECT * FROM categoria', (err, results) => {
    if (err) {
      console.error('Error al obtener categorias:', err);
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
});

app.get('/categorias/:id', (req, res) => {
  const { id } = req.params;
  db.query('SELECT * FROM categoria WHERE id_categoria = ?', [id], (err, results) => {
    if (err) {
      console.error('Error al obtener categoria por ID:', err);
      return res.status(500).json({ error: err.message });
    }
    if (results.length === 0) return res.status(404).json({ error: 'Categoría no encontrada' });
    res.json(results[0]);
  });
});

app.post('/categorias', (req, res) => {
  const { nombre_categoria, descripcion_categoria } = req.body;
  const sql = 'INSERT INTO categoria (nombre_categoria, descripcion_categoria) VALUES (?, ?)';
  db.query(sql, [nombre_categoria, descripcion_categoria], (err, result) => {
    if (err) {
      console.error('Error al crear categoria:', err);
      return res.status(500).json({ error: err.message });
    }
    res.status(201).json({ message: 'Categoría creada', id: result.insertId });
  });
});

app.put('/categorias/:id', (req, res) => {
  const { id } = req.params;
  const { nombre_categoria, descripcion_categoria } = req.body;
  const sql = 'UPDATE categoria SET nombre_categoria = ?, descripcion_categoria = ? WHERE id_categoria = ?';
  db.query(sql, [nombre_categoria, descripcion_categoria, id], (err, result) => {
    if (err) {
      console.error('Error al actualizar categoria:', err);
      return res.status(500).json({ error: err.message });
    }
    res.json({ message: 'Categoría actualizada' });
  });
});

app.delete('/categorias/:id', (req, res) => {
  const { id } = req.params;
  db.query('DELETE FROM categoria WHERE id_categoria = ?', [id], (err, result) => {
    if (err) {
      console.error('Error al eliminar categoria:', err);
      return res.status(500).json({ error: err.message });
    }
    res.json({ message: 'Categoría eliminada correctamente' });
  });
});

// Servidor escuchando
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Servidor escuchando en http://localhost:${PORT}`);
});
