const mysql = require('mysql2');

    const conn = mysql.createConnection({
        host: 'localhost',
        port: 3306,
        user: 'soos',
        password: 'Defusr1303.',
        database: 'soos'
    });

exports.connect = () =>{
    conn.connect(function (err) {
        console.log('conectou!');
    });
    conn.on('error', function(err) {
        console.log("[mysql error]",err);
    });
}

exports.execSQLQuery = (sqlQry, res) => {

    return conn.query(sqlQry, function (err,results, fields) {
        if(err){ 
            console.log("erro") ;
            res.redirect("/cliente/novo");
            return false ;
        }

        console.log("sucesso")
        conn.end();
        res.redirect("/cliente/login");
        return true;
    });

}


module.export = conn;




