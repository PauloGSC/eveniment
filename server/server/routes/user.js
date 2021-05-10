'use strict';

const Controller = require('../controllers/userCtrl');
const schema = require('./schemas/user');

exports.plugin = {
	name: 'routes-user',
	version: '1.0.0',
	register: async function (server, options, next) {

		const controller = new Controller(server);

		server.bind(controller);

		server.route([
			{
				method: 'POST',
				path: '/api/user',
				handler: controller.create,
				options: {
					validate: {
						payload: schema.payload,
					}
				}
			}, {
				method: 'PUT',
				path: '/api/user',
				handler: controller.update,
				options: {
					validate: {
						payload: schema.payload,
						query: schema.id,
					}
				}
			}, {
				method: 'DELETE',
				path: '/api/user/{id}',
				handler: controller.delete,
				options: {
					validate: {
						params: schema.id,
					}
				}
			}, {
				method: 'GET',
				path: '/api/user/{id}',
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
