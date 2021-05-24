'use strict';

const Controller = require('../controllers/eventCtrl');
const schema = require('./schemas/event');
const Joi = require('joi');

exports.plugin = {
	name: 'routes-event',
	version: '1.0.0',
	register: async function (server, options, next) {

		const controller = new Controller(server);

		server.bind(controller);

		server.route([
			{
				method: 'GET',
				path: '/api/event/myevents',
				handler: controller.findMyEvents,
			},
			{
				method: 'GET',
				path: '/api/event',
				handler: controller.findAll,
				options: {
					validate: {
						query: Joi.object({
							idUser: Joi.number(),
						})
					}
				}
			}, {
				method: 'POST',
				path: '/api/event',
				handler: controller.create,
				options: {
					validate: {
						payload: schema.payload
					}
				}
			}, {
				method: 'PUT',
				path: '/api/event',
				handler: controller.update,
				options: {
					validate: {
						payload: schema.payload,
						query: schema.id,
					}
				}
			}, {
				method: 'DELETE',
				path: '/api/event/{id}',
				handler: controller.delete,
				options: {
					validate: {
						params: schema.id,
					}
				}
			}, {
				method: 'GET',
				path: '/api/event/{id}',
				handler: controller.findById,
				options: {
					validate: {
						params: schema.id,
					}
				}
			}
		]);
	}
}
