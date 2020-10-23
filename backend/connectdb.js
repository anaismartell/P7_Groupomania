const mysql = require('mysql');
console.log('Connexion à la base de données...');
let connectdb = mysql.createConnection({ 
    host: 'localhost', 
    user: 'root', 
    password: 'Elgato1504', 
    database: 'groupomania', 
});
connectdb.connect(function(err) { 
    if (err) throw err;
    console.log('Connecté à Groupomania !')
});

module.exports = connectdb;

