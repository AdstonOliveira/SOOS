const sql = require('../db/conn.js');
const express = require('express');
const knex = require('../db/knex.js');

exports.getTipos = (req, res, next) => {

    knex

}

exports.getNovo = (req,res,next) =>{
    

    const marcas = knex().select().from('marca').then( function(result){

            const tipo = knex().select().from('tipo').then( function(tipos){
                console.log('tipo: ' + tipos[0].descricao);
                console.log('Marca: ' + result[0].marca);

                tipos.forEach(function(tipo){
                    console.log("ForEach: " + tipo.descricao);
                })
                res.render('equipamento/novo',{marcas: result, tipos:tipos});
            })
        })       
        .catch(err=>{
            res.status(500).json({})
        })

        
        
        // console.log(marcas.id)
}


    /*
    knex("tipo").then( (tipo) => {

        const dados = knex("marca").then( (marca)=>{
            console.log(marca);
            return JSON.stringify(marca);
        }).then( (tipo)=>{
            console.log(tipo)
        }).catch(err=>{
            res.redirect("/cliente/novo");
        });
        console.log(dados);
    }
/*
        const tipos = tipo;
        console.log(marcas, tipos);

        res.render('equipamento/novo' ,{ 
            tipo: tipos,
            marca: marcas
        });

    }).then(()=>{

    });

}
*/