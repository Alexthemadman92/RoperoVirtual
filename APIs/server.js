require("dotenv").config();

const express = require("express");
const multer = require("multer");
const path = require("path");
const fs = require("fs");
const mongoose = require("mongoose");
const cors = require("cors");
const bcrypt = require("bcrypt");

const connectDB = require("./db");
const Ropa = require("./models/Ropa");
const User = require("./models/User");  // Asegúrate de importar el modelo de usuario

const prendasRouter = require("./routes/prendas");
const usersRouter = require("./routes/users");  // Asegúrate de que la ruta sea correcta

// Conectar a MongoDB
connectDB();

const app = express();

app.use(express.json());
app.use("/api/prendas", prendasRouter);
app.use("/api/users", usersRouter);  // Ruta para usuarios

// Configurar CORS
app.use(cors());

// Configurar multer para subir imágenes
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/"); // Carpeta donde se guardarán las imágenes
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname)); // Generar un nombre único para cada imagen
  },
});

const upload = multer({ storage });

// Configuración para servir las imágenes desde la carpeta 'uploads'
app.use("/uploads", express.static("uploads"));

// Crear la carpeta 'uploads' si no existe
if (!fs.existsSync("uploads")) {
  fs.mkdirSync("uploads");
}

// Ruta POST para subir imágenes
app.post("/api/upload", upload.array("images", 100), (req, res) => {
  if (!req.files || req.files.length === 0) {
    return res.status(400).json({ error: "No se han cargado imágenes" });
  }

  const imageUrls = req.files.map((file) => `/uploads/${file.filename}`);
  res.status(200).json({ message: "Imágenes cargadas exitosamente", images: imageUrls });
});

// Ruta GET para obtener una prenda aleatoria
app.get("/api/recomendar", async (req, res) => {
  try {
    const prenda = await Ropa.aggregate([{ $sample: { size: 1 } }]);

    if (prenda.length === 0) {
      return res.status(404).json({ error: "No hay prendas disponibles" });
    }

    res.status(200).json(prenda[0]);
  } catch (err) {
    console.error("Error al obtener la prenda:", err);
    res.status(500).json({ error: "Error al obtener la prenda" });
  }
});

// Iniciar el servidor
const PORT = process.env.PORT || 3500;
app.listen(PORT, () => {
  console.log(`Servidor corriendo en el puerto ${PORT}`);
});