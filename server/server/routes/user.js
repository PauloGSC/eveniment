'use strict';

const Controller = require('../controllers/userCtrl');
const Joi = require('joi');

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
						payload: Joi.object({
							name: Joi.string().min(1).max(10).required(),
							password: Joi.string().max(30).required(),
							email: Joi.string().max(30).required(),
							isAdmin: Joi.boolean().required(),
							registration: Joi.number().required(),
							ocupation: Joi.string().max(20).required(),
							dtUpdate: Joi.string().required(),
						})
					}
				}
      }
		]);
	}
}
