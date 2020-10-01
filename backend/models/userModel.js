// Modèle de données pour tous les users

const connectdb = require('../connectdb.js');
const mysql = require('mysql');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

class UserModel {
    
    signup(sqlInsert){
        let sql_request = 'INSERT INTO users VALUES(NULL, ?, ?, ?, ?, NULL)';
        sql_request = mysql.format(sql_request, sqlInsert);
        return new Promise((resolve, reject) =>{
            connectdb.query(sql, function(err, result){ // extraction du résultat avec la méthode .query
                if (err) reject({error : 'L\'inscription a échouée.'});
                resolve({message : 'Le nouvel utilisateur a bien été créé!'})
            })
        })
    }

    login(sqlInsert, password){
        let sql_request = 'SELECT * FROM users WHERE email = ?';
        sql_request = mysql.format(sql_request, sqlInsert);
        return new Promise((resolve, reject) =>{
            connectdb.query(sql_request, function(err, result){
                if (err) reject({ err });
                if (!result[0]){
                    reject ({ error : 'L\'utilisateur est introuvable dans la base de données.'});
                } else { // else si le mail a une correspondance dans la base alors: 
                    bcrypt.compare(password, result[0].password) // bcrypt compare le mot de passe 
                        .then(valid => { 
                            if (!valid) return reject({ error: 'Mot de passe incorrect !' }); // Si le mdp n'est pas valide error 
                            resolve({ // Si tout est ok : génération du token 
                                userId: result[0].id,
                                moderation: result[0].moderation,
                                token: jwt.sign(
                                    { userId: result[0].id,
                                    moderation: result[0].moderation },
                                    'RANDOM_TOKEN_SECRET',
                                    { expiresIn: '24h' } 
                                )
                            });
                        })
                        .catch(error => reject({ error }));
                }
            })
        })
    };

    displayProfile(sqlInsert){
        let sql_request = 'SELECT firstName, lastName, email FROM users WHERE id = ?';
        sql_request = mysql.format(sql_request,sqlInsert);
        return new Promise((resolve, reject) =>{
            connectdb.query(sql, function(err, result){
                if (err) return reject({error : 'La page est indisponible'});
                resolve(result);
            }) 
        })
    };

    updateProfile(sqlInsert){
        let sql_request = 'UPDATE users SET firstName = ?, lastName = ?, email = ? WHERE id = ?';
        sql_request = mysql.format(sql_request,sqlInsert);
        return new Promise((resolve, reject) =>{
            connectdb.query(sql_request, function(err, result){
                if (err) return reject({error : 'La fonction est indisponible'});
                resolve({message : 'Les informations ont bien été mises à jour!'});
            }) 

        })
    };

    deleteUser(sqlInsert){
        let sql_request = 'DELETE FROM users WHERE id = ?'; 
        sql_request = mysql.format(sql_request,sqlInsert);
        return new Promise((resolve, reject) =>{
            connectdb.query(sql_request, function(err, result){
                if (err) return reject({error : 'fonction indisponible'});
                resolve({message : 'Utilisateur supprimé'});
            }) 

        })
    
    }
};

module.exports = UserModel;