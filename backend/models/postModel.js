// Modèle de données pour toutes les actions des collaborateurs

const connectdb = require('../connectdb.js');
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');


class PostModel {

    getAllPosts(){
        // variable sql = Requête SQL SELECT.... FROM posts JOIN users ON posts.userId = users.id BY...
        // retourne une nouvelle promise 
            // extraction du résultat avec la méhode .query 
                // gestion erreurs
    }

    createPost(){
        // variable sql = INSERT INTO posts VALUES (....);
        // retourne une nouvelle promise 
            // extraction du résultat avec la méhode .query 
                // gestion erreurs
    }

    updatePost(){ // possibilité de modifier uniquement ses propres posts
        // Première requête SELECT pour sélectionner le post 
        // retourne une promesse 
            // extraction du résultat avec la méthode .query
                // if condition si l'user id correspond deuxième requête
                // requête UPDATE posts SET .... 
                // extrction du résultat avec la méthode .query
                    // si tout est ok message 
                // gestion des erreurs
    }

    deletePost(){ // possibilité de supprimer uniquement ses propres posts

    }

    getComments(){ 

    }

    createComment(){

    }

    updateComment(){ // possibilité de modifier uniquement ses propres commentaires

    }

    deleteComment(){ // possibilité de supprimer uniquement ses propres commentaires
 
    }

    getAlllikes(){ 

    }

    postLike(){


    }

}

module.exports = PostModel;