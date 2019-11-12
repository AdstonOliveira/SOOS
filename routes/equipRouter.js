const express = require('express');
const router = express.Router();

const controllerEquip = require("../controllers/ControllerEquip");

router.get('/novo', controllerEquip.getNovo);           



module.exports = router;