'use strict';

const Controller = require('../controllers/subscribeCtrl');
const schema = require('./schemas/subscribe');

exports.plugin = {
  name: 'routes-subscribe',
  version: '1.0.0',
  register: async function (server, options, next) {

    const controller = new Controller(server);

    server.bind(controller);

    server.route([
      {
        method: 'GET',
        path: '/api/subscribe',
        handler: controller.list,
      }, {
        method: 'POST',
        path: '/api/subscribe',
        handler: controller.create,
        options: {
          validate: {
            payload: schema.payload
          }
        }
      }, {
        method: 'PUT',
        path: '/api/subscribe',
        handler: controller.update,
        options: {
          validate: {
            payload: schema.payload,
            query: schema.id,
          }
        }
      }, {
        method: 'DELETE',
        path: '/api/subscribe/{id}',
        handler: controller.delete,
        options: {
          validate: {
            params: schema.id,
          }
        }
      }, {
        method: 'GET',
        path: '/api/subscribe/{id}',
        handler: controller.show,
        options: {
          validate: {
            params: schema.id,
          }
        }
      }
    ]);
  }
}
