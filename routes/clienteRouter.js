const express = require('express');
const router = express.Router();

const clienteController = require('../controllers/ControllerCliente');

router.get('/', clienteController.getIndex);
router.get('/login', clienteController.getLogin);
router.get('/novo', clienteController.getNovo);
//router. get('/testeapi', clienteController.testeAPI);
router.post('/novo', clienteController.postNovo);

module.exports = router;
