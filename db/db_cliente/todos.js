const conn = require('../conn.js');

function all(sqlQry, res){
    conn.all('SELECT * FROM cliente', res);
}
