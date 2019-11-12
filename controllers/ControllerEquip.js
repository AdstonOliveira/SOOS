const sql = require('../db/conn.js');
const express = require('express');
const knex = require('../db/knex.js');

exports.getTipos = (req, res, next) => {

    knex

}

exports.getNovo = (req,res,next) =>{
    // knex("tipo").then( (tipos) => {
    //     knex("marca").then( (marcas)=>{
    //         marcas = JSON.stringify(marcas),
    //         tipos =  JSON.stringify(tipos);
    //         // res.send(marcas);
    //         console.log(marcas)
    //         res.render('equipamento/novo' ,{ 
    //             tipo: tipos,
    //             marca: marcas
    //         });
    
    //     })
    // });

    res.render("equipamento/novo");
    
}
