// Modèle de données pour toutes les actions du profil du chargé de communication. 

const connectdb = require('../connectdb.js');
const mysql = require('mysql');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');


class ModModels { 

    getAllPosts() { // peut afficher tous les posts

    }

    deletePost (){ // peut supprimer n'importe quel post

    }

    getAllComments(){ // peut afficher tous les commentaires

    }

    deleteComment(){ // peut supprimer tous les commentaires

    }

}

module.exports = ModModels;