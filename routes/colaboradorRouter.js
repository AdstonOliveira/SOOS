const express = require('express');
const router = express.Router();

const colaboradorController = require('../controllers/controllerColaborador');

router.get('/login', colaboradorController.getLogin);

module.exports = router;