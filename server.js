const express = require('express');
const mysql = require('mysql');

const app = express();
app.use(express.json());

// Konfigurasi koneksi MySQL
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'ta_stechoq',
});

// Membuat koneksi ke MySQL
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
  } else {
    console.log('Connected to MySQL');
  }
});

// Membuat endpoint untuk menambah data Employee (Create)
app.post('/data_employee', (req, res) => {
  const data_employee = req.body;

  const sql = 'INSERT INTO data_employee (id_employee, id_mesin, nama, tgl_lahir, tempat_lahir, jenis_kelamin, email, no_hp, status, alamat, keterangan) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';

  connection.query(
    sql,
    [
      data_employee.id_employee,
      data_employee.id_mesin,
      data_employee.nama,
      data_employee.tgl_lahir,
      data_employee.tempat_lahir,
      data_employee.jenis_kelamin,
      data_employee.email,
      data_employee.no_hp,
      data_employee.status,
      data_employee.alamat,
      data_employee.keterangan,
    ],
    (err, result) => {
      if (err) {
        console.error('Error inserting data:', err);
        res.status(500).send('Error inserting data');
      } else {
        res.send(result);
      }
    }
  );
});

// Membuat endpoint untuk mendapatkan semua data Employee (Read)
app.get('/data_employee', (req, res) => {
  connection.query('SELECT * FROM data_employee', (err, rows) => {
    if (err) {
      console.error('Error retrieving data:', err);
      res.status(500).send('Error retrieving data');
    } else {
      res.send(rows);
    }
  });
});

// Membuat endpoint untuk mendapatkan satu data Employee berdasarkan ID (Read)
app.get('/data_employee/:id_employee', (req, res) => {
  const id_employee = req.params.id_employee;

  connection.query('SELECT * FROM data_employee WHERE id_employee = ?', id_employee, (err, rows) => {
    if (err) {
      console.error('Error retrieving data:', err);
      res.status(500).send('Error retrieving data');
    } else if (rows.length === 0) {
      res.status(404).send('Employee not found');
    } else {
      res.send(rows[0]);
    }
  });
});

// Membuat endpoint untuk mengubah data Employee berdasarkan ID (Update)
app.put('/data_employee/:id_employee', (req, res) => {
  const id_employee = req.params.id_employee;
  const data_employee = req.body;

  const sql = 'UPDATE data_employee SET id_mesin=?, nama=?, tgl_lahir=?, tempat_lahir=?, jenis_kelamin=?, email=?, no_hp=?, status=?, alamat=?, keterangan=? WHERE id_employee = ?';

  connection.query(
    sql,
    [
      data_employee.id_mesin,
      data_employee.nama,
      data_employee.tgl_lahir,
      data_employee.tempat_lahir,
      data_employee.jenis_kelamin,
      data_employee.email,
      data_employee.no_hp,
      data_employee.status,
      data_employee.alamat,
      data_employee.keterangan,
      id_employee,
    ],
    (err, result) => {
      if (err) {
        console.error('Error updating data:', err);
        res.status(500).send('Error updating data');
      } else if (result.affectedRows === 0) {
        res.status(404).send('Employee not found');
      } else {
        res.send(result);
      }
    }
  );
});

// Membuat endpoint untuk menghapus data Employee berdasarkan ID (Delete)
app.delete('/data_employee/:id_employee', (req, res) => {
  const id_employee = req.params.id_employee;

  const sql = 'DELETE FROM data_employee WHERE id_employee = ?';

  connection.query(sql, id_employee, (err, result) => {
    if (err) {
      console.error('Error deleting data:', err);
      res.status(500).send('Error deleting data');
    } else if (result.affectedRows === 0) {
      res.status(404).send('Employee not found');
    } else {
      res.send(result);
    }
  });
});

// Menjalankan server pada port 1800
app.listen(1800, () => {
  console.log('Server is running on port 1800');
});
