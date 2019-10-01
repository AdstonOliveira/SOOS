const express = require('express');
const router = express.Router();

const clienteController = require('../controllers/ControllerCliente');



router.get('/', clienteController.getIndex);

router.get('/login', clienteController.getLogin);

router.get('/novo', clienteController.getNovo);


module.exports = router;
