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
  console.log("Senha digitada: " + dados.senha);

  knex("cliente").insert(dados).then( (dados)=>{
    res.redirect("/cliente/login");
  }).catch(err=>{
    res.redirect("/cliente/novo");
  })

}

exports.postLogin = (req, res, next) => {
  const bcrypt = require('bcrypt');
  const salt = bcrypt.genSaltSync(10);

  // console.log(req.body);

  var usr_email = req.body.email;
  let senha = req.body.senha;
  
  var usr_senha = bcrypt.hashSync(senha, salt);

  console.log("Senha digitada: " + usr_senha);

  var pwd = knex('cliente').where({ email: usr_email }).first() ;
      pwd.then( function(result){
      // console.log(result.email);
      if(result.senha == usr_senha){
        console.log(result.senha + "aca " + usr_senha)
        res.send('/cliente/index');
      }else{
        console.log(result.senha + "aca " + usr_senha)
        res.redirect('/cliente/login');
      }

  }).catch(err=>{
    res.status(400).json({});
  })

  



}

 