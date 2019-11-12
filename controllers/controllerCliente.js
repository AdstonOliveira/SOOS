const sql = require('../db/conn.js');
const express = require('express');
const knex = require('../db/knex.js');
const bcrypt = require('bcrypt');

const salt = bcrypt.genSaltSync(10);


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

  dados={ 
    nome: req.body.nome,
    email: req.body.email,
    senha: bcrypt.hashSync(req.body.senha, salt),
    salt
  }

  knex("cliente").insert(dados).then( (dados)=>{
    res.redirect("/cliente/login");
  }).catch(err=>{
    res.redirect("/cliente/novo");
  })

};

exports.postLogin = (req, res, next) => {
  // console.log(req.body);
  var usr_email = req.body.email;
  let senha = req.body.senha;

  console.log("Salt: " + salt);

  var pwd = knex('cliente').where({ email: usr_email }).first();

      pwd.then( function(result){
        let salto = result.salt;
        let usr_senha = bcrypt.hashSync(senha, salto);  

        if(result.senha === usr_senha){
          res.send('/os/index', { result });
        }else{
          res.status(404).redirect('/cliente/login');
        }
    }).catch(err=>{
      res.status(500).json({});
    })

  



}

 