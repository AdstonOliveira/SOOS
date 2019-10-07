const knex = require("knex")({
    client: "mysql2",
    connection:{
        host: 'localhost',
        port: 3306,
        user: 'soos',
        password: 'Defusr1303.',
        database: 'soos'}
});

module.exports = knex;
