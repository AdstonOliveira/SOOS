const sql = require('../db/conn.js');
const express = require('express');
const knex = require('../db/knex.js');

exports.getIndex = (req, res, next) => {
    res.render('cliente/index', {
      titulo: 'SOOS - Pagina do cliente',
    });
  };

exports.getLogin = (req, res, next) =>{
  res.render('cliente/login', {
    titulo: 'Cliente Login',
  });
  };

exports.getNovo = (req, res, next) =>{
  res.render('cliente/novo', {
    titulo: 'Novo Cliente',
    formAction: '/cliente/novo',
    method: 'POST',
  });
};

exports.testeAPI = (req, res, next) =>{
  sql.execSQLQuery('SELECT * FROM Cliente', res);
}

exports.postNovo = (req, res, next) => {
  const bcrypt = require('bcrypt');
  const salt = bcrypt.genSaltSync(10);

  query = "insert into cliente (nome, email,senha) values ('"+req.body.nome
    +"','"+req.body.email+"','"+bcrypt.hashSync(req.body.senha,salt)+"')";

    sql.connect();

  sql.execSQLQuery(query, res);
  
}

 