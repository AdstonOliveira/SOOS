const express = require('express');
const router = express.Router();

const OSController = require ("../controllers/ControllerOS");

router.get('/nova', OSController.getNovo);
router.get('/novaOS', OSController.getNovaOS);
module.exports = router;