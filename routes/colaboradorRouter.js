const express = require('express');
const router = express.Router();

const colaboradorController = require('../controllers/ControllerColaborador');

router.get('/login', colaboradorController.getLogin);

router.get('/index', colaboradorController.getIndex);

module.exports = router;