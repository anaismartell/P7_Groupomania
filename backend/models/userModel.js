// Modèle de données pour tous les users

const connectdb = require('../connectdb.js');
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

class UserModels {
    
    signup(){
        // variable sql = requête SQL INSERT INTO users VALUES... 
        // retourne une nouvelle promesse 
            // extraction du résultat avec la méhode .query 
    }

    login(){
        // variable sql = requête SELECT * FROM users...
        // retourne une nouvelle promesse 
            // extraction du résultat avec la méthode .query
                // condition if : si le mail est introuvable 
                // else si le mail a une correspondance dans la base alors: 
                    // bcrypt compare le mot de passe 
                        // Si le mdp n'est pas valide error 
                        // Si tout est ok : génération du token 
                    //.catch error
    }

    seeMyProfile(){
        // variable sql = requête SQL SELECT... WHERE id = ?
        // retourne une nouvelle promesse 
            // extraction du résultat avec la méthode .query
    }

    updateProfil(){
        // variable sql = requête SQL UPDATE users SET... WHERE id = ?
        // retourne une nouvelle promesse 
            // extraction du résultat avec la méthode .query

    }

    deleteUser()
        // variable sql = requête SQL DELETE FROM users WHERE id = ?
        // retourne une nouvelle promesse 
            // extraction du résultat avec la méthode .query
}

module.exports = UserModels;