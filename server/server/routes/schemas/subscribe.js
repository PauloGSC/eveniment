const Joi = require('joi');

payload = Joi.object({
  idEvent: Joi.number().required(),
  idUser: Joi.number().required(),
});

id = Joi.object({
  id: Joi.number().required(),
});

module.exports = { payload, id };