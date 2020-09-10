const express = require('express');
const path = require('path');
require('dotenv').config();

app = express();

const server = require('http').createServer(app);
module.exports.io = require('socket.io')(server);

require('./socket/socket');



const publicPath = path.resolve(__dirname, '../public');

// Agregando contenido estático a Node
app.use(express.static(publicPath));

server.listen(process.env.PORT, (err) => {
    if (err) {
        throw new Error(err);
    }

    console.log(`Listening at port ${process.env.PORT}`);
});