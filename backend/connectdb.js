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


/*
require('dotenv').config();
const mysql = require('mysql');

// Connexion à MYSQL
const connectdb = mysql.createConnection({
  user : process.env.USER,
  password : process.env.PASS,
  host : process.env.HOST,
  database : process.env.DATABASE
});

connectdb.connect(function(err){
    if(!err) {
        console.log("Connexion à groupomania !");
    } else {
        console.log("Erreur de connexion");
    }
    })

module.exports = connectdb; */
