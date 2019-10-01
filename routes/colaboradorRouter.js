const express = require('express');
const router = express.Router();

const colaboradorController = require('../controllers/ControllerColaborador');

router.get('/login', colaboradorController.getLogin);

module.exports = router;