const mongoose = require("mongoose");

const ropaSchema = new mongoose.Schema({
  tipo: { type: String, required: true },
  nombre: { type: String, required: true },
  descripcion: { type: String },
  imagenes: [String], // URLs de imágenes subidas
}, { collection: 'prendas' }); // Fuerza el uso de la colección "prendas"

module.exports = mongoose.model("Ropa", ropaSchema);