'use strict';

const Controller = require('../controllers/eventCtrl');
const Joi = require('joi');

exports.plugin = {
	name: 'routes-event',
	version: '1.0.0',
	register: async function (server, options, next) {

		const controller = new Controller(server);

		server.bind(controller);

		server.route([
			{
        method: 'POST',
				path: '/api/event',
				handler: controller.create,
				options: {
					validate: {
						payload: Joi.object({
							name: Joi.string().max(20).required(),
              cdConfirm: Joi.string().max(20).required(),
              description: Joi.string().max(200).required(),
              dtInit: Joi.string().required(),
              dtEnd: Joi.string().required(),
              dtUpdate: Joi.string().required(),
              image: Joi.string().max(40).required(),
              idUs: Joi.number().required(),
						})
					}
				}
      }
		]);
	}
}
