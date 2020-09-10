const { io } = require('../server');

// mensajes por sockets
io.on('connection', client => {
    console.log("Client connected");
    client.on('disconnect', () => {
        console.log("Client disconnected");
    });

    client.on('message', (payload) => {
        console.log(payload);
        io.emit('message', { admin: "Welcome!" });
    });
});