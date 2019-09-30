const express = require('express');
const router = express.Router();

const clienteController = require('../controllers/ControllerCliente');

router.get('/', clienteController.getIndex);



module.exports = router;
