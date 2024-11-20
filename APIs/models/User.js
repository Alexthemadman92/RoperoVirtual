const mongoose = require("mongoose");

const UserSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true, // Obligatorio que el usuario tenga un nombre
    },
    email: {
      type: String,
      unique: true, // Cada correo debe ser único
      required: true, // El email es obligatorio
      lowercase: true, // Guarda el email en minúsculas
      match: [/\S+@\S+\.\S+/, "Correo no válido"], // Validación básica del formato
    },
    password: {
      type: String,
      required: true, // Obligatorio para autenticación
      minlength: 8, // Mínimo 8 caracteres para mayor seguridad
    },
    avatar: {
      type: String, // URL del avatar del usuario
      default: "", // Valor por defecto si no sube uno
    },
    preferences: {
      style: {
        type: String, // Por ejemplo, 'casual', 'formal', 'deportivo'
        default: "casual",
      },
      moodTrackingEnabled: {
        type: Boolean, // Para habilitar/deshabilitar sugerencias basadas en el estado de ánimo
        default: true,
      },
    },
    createdAt: {
      type: Date,
      default: Date.now, // Fecha de creación automática
    },
  },
  {
    timestamps: true, // Crea automáticamente 'createdAt' y 'updatedAt'
  }
);

const User = mongoose.model("User", UserSchema);

module.exports = User;