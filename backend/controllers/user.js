const connectdb = require('../connectdb.js');
const mysql = require('mysql');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const UserModels = require ('../models/userModel.js');

let userModels = new UserModels();

exports.signup = () => {
    // variable email
    // variable password
    // variable firstname
    // variable lastname
    // hash du mot de passe 
        //.then
        //.catch
    //.catch

}

exports.login = () => {
    // variable email
    // variable password
    // .then
    //.catch
}

exports.seeMyProfile = () => {
    // récupère le token
    // décode le token
    // stocke dans une variable le token décodé de l'userId
    // variable sql qui stocke l'user ID 
    // on insère la variable sql 
    //.then
    //.catch
}

exports.updateProfile = () => {
    // variable qui stocke le firstname saisi
    // variable qui stocke le lastname saisi
    // variable qui stock l'email saisi
    // récupère le token
    // décode le token
    // stocke dans une variable le token décodé de l'userId
    // variable sql qui stocke le firstname, lastname, email et userId 
    // on insère la variable sql 
    //.then
    //.catch

}

exports.deleteUser = () => {
    // récupère le token
    // décode le token
    // stocke dans une variable le token décodé de l'userId
    // variable sql qui stocke l'user ID 
    // on insère la variable sql 
    //.then
    //.catch
}
