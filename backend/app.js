const express = require('express');
const bodyParser = require('body-parser');
const helmet = require("helmet");
const app = express();
const routesPosts = require('./routes/routesPosts');
const routesUsers = require('./routes/routesUsers');
const routesModeration = require('./routes/routesModeration');
const connectdb = require('./connectdb.js'); 

app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
    next();
});

app.use (helmet()); 
app.use(bodyParser.json());


app.use('/api/posts', routesPosts);
app.use('/api/auth', routesUsers);
app.use('/api/moderation', routesModeration);

module.exports = app;