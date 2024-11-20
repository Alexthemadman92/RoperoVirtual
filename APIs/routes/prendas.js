const express = require("express");
const multer = require("multer");
const Ropa = require("../models/Ropa"); // Cambiar importación a Ropa.js

const router = express.Router();

// Configuración de multer para la subida de imágenes
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, "uploads/"),
  filename: (req, file, cb) => cb(null, Date.now() + "-" + file.originalname),
});
const upload = multer({ storage });

// GET: Obtener prendas con filtros por tipo y nombre
router.get("/", async (req, res) => {
  const { tipo, nombre } = req.query;

  try {
    // Si solo tipo está presente, buscamos todas las prendas con ese tipo
    if (tipo && !nombre) {
      const ropas = await Ropa.find({ tipo: new RegExp(`^${tipo}$`, "i") });
      if (ropas.length === 0) {
        return res.status(404).json({ error: "No se encontraron prendas de este tipo" });
      }
      return res.json(ropas); // Devuelve todas las prendas con ese tipo
    }

    // Si tipo y nombre están presentes, devolvemos solo la galería de imágenes de esa prenda
    if (tipo && nombre) {
      const ropas = await Ropa.find({
        tipo: new RegExp(`^${tipo}$`, "i"),
        nombre: new RegExp(`^${nombre}$`, "i"),
      });

      if (ropas.length === 0) {
        return res.status(404).json({ error: "No se encontraron prendas con ese tipo y nombre" });
      }

      // Solo devolver las imágenes
      const imagenes = ropas.map((prenda) => prenda.imagenes).flat();
      return res.json({ imagenes });
    }

    // Si no se pasa tipo ni nombre, devuelve todas las prendas
    const ropas = await Ropa.find();
    if (ropas.length === 0) {
      return res.status(404).json({ error: "No se encontraron prendas" });
    }
    res.json(ropas); // Devuelve todas las prendas con todos sus campos
  } catch (err) {
    console.error("Error al obtener prendas:", err);
    res.status(500).json({ error: "Error al obtener prendas" });
  }
});

// POST: Agregar una nueva prenda
router.post("/", upload.single("imagen"), async (req, res) => {
  const { tipo, nombre, descripcion } = req.body;
  const imagenUrl = req.file ? `/uploads/${req.file.filename}` : null;

  try {
    const nuevaRopa = new Ropa({
      tipo,
      nombre,
      descripcion,
      imagenes: imagenUrl ? [imagenUrl] : [],
    });

    await nuevaRopa.save();
    res.status(201).json({ mensaje: "Prenda agregada exitosamente" });
  } catch (err) {
    console.error("Error al agregar prenda:", err);
    res.status(500).json({ error: "Error al agregar prenda" });
  }
});

module.exports = router;