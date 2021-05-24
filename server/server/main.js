'use strict';

const Hapi = require('@hapi/hapi');
const path = require('path');
const Config = require('../config/local.json');

require('../app/eveniment');

const init = async () => {

  const server = Hapi.server({
    port: 8000,
    routes: {
      cors: true
    }

  });

  await server.register(require('./middleware/plugins'));

  server.auth.strategy('jwt', 'jwt', {
    key: Config.authKey,
    validate: require('./middleware/common/authentication'),
    verifyOptions: {
      ignoreExpiration: true
    }
  });
  server.auth.default('jwt');

  await server.start();
  console.log('Server running on %s', server.info.uri);
};

process.on('unhandledRejection', (err) => {
  console.log(err);
  process.exit(1);
});

init();