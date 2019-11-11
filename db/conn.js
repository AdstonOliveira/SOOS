// const mysql = require('mysql2');

//     const conn = mysql.createConnection({
//         host: 'localhost',
//         port: 3306,
//         user: 'root',
//         password: '',
//         database: 'soos'
//     });

// exports.connect = () =>{
//     conn.connect(function (err) {
//         console.log('conectou!');
//     });
//     conn.on('error', function(err) {
//         console.log("[mysql error]",err);
//     });
// }

// exports.execSQLQuery = (sqlQry, res) => {

//     conn.query(sqlQry, function (err,results, fields) {
//         if(err){ 
//             console.log("erro") ;
//             res.redirect("/cliente/novo");
//             return false ;
//         }

//         console.log("sucesso")
//         conn.end();
//         res.json(results);
//         return true;
//     });

// }


// module.export = conn;




