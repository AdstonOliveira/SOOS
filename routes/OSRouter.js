const express = require('express');
const router = express.Router();

const OSController = require ("../controllers/ControllerOS");

router.get('/index/:idOS', OSController.getIndex);

router.get('/novaOS', OSController.getNovaOS);
module.exports = router;