const sql = require('../db/conn.js');
const express = require('express');
const knex = require('../db/knex.js');

// exports.getAll = (req, res, next) => {

// }

exports.getNovo = (req, res, next) =>{
    res.render("os/index");
}
