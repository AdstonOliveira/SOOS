const express = require('express');
const router = express.Router();

const clienteController = require('../controllers/controllerCliente');



router.get('/', clienteController.getIndex);

router.get('/login', clienteController.getLogin);



module.exports = router;
