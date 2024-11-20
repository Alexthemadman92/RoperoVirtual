const express = require('express');
const UserController = require('../controllers/UserController'); // Importa el controlador de usuarios
const router = express.Router();

// Definir rutas para cada endpoint

// Obtener todos los usuarios
router.get('/', UserController.getData);

// Iniciar sesión
router.post('/login', UserController.login);

// Crear un nuevo usuario
router.post('/', UserController.createUser);

// Obtener un usuario por ID
router.get('/:id', UserController.getUserById);

// Actualizar un usuario por ID
router.put('/:id', UserController.updateUser);

// Eliminar un usuario por ID
router.delete('/:id', UserController.deleteUser);

module.exports = router;