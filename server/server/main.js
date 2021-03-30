'use strict';

const Hapi = require('@hapi/hapi');
const path = require('path');

require('../app/eveniment');

const init = async () => {

  const server = Hapi.server({
    port: 8000,
    routes: {
      cors: true
    }

  });

  await server.register(require('./middleware/plugins'));

  await server.start();
  console.log('Server running on %s', server.info.uri);
};

process.on('unhandledRejection', (err) => {
  console.log(err);
  process.exit(1);
});

init();