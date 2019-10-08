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

  dados={ 
    nome: req.body.nome,
    email: req.body.email,
    senha: bcrypt.hashSync(req.body.senha,salt)
  }

  knex("cliente").insert(dados).then( (dados)=>{
    res.redirect("/cliente/login");
  }).catch(err=>{
    res.redirect("/cliente/novo");
  })

  
  
}

 