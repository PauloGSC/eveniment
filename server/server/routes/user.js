'use strict';

const Controller = require('../controllers/userCtrl');
const schema = require('./schemas/user');
const Joi = require('joi');

exports.plugin = {
	name: 'routes-user',
	version: '1.0.0',
	register: async function (server, options, next) {

		const controller = new Controller(server);

		server.bind(controller);

		server.route([
			{
				method: 'GET',
				path: '/api/user/login',
				handler: controller.login,
				options: {
					auth: false,
					validate: {
						query: Joi.object({
							email: Joi.string().required(),
							password: Joi.string().required()
						})
					}
				}
			}, {
				method: 'GET',
				path: '/api/user',
				handler: controller.findAll,
				options: {
					validate: {
						query: Joi.object({})
					}
				}
			}, {
				method: 'GET',
				path: '/api/user/{id}',
				handler: controller.findById,
				options: {
					validate: {
						params: schema.id,
					}
				}
			}, {
				method: 'POST',
				path: '/api/user',
				handler: controller.create,
				options: {
					auth: false,
					validate: {
						payload: schema.payload,
					}
				}
			}, {
				method: 'PUT',
				path: '/api/user/{id}',
				handler: controller.update,
				options: {
					validate: {
						payload: schema.payload,
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
			},
		]);
	}
}
