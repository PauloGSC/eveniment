const Joi = require('joi');

const payload = Joi.object({
  name: Joi.string().min(1).max(99).required(),
  password: Joi.string().max(200).required(),
  image: Joi.string(),
  email: Joi.string().max(99).required(),
  isAdmin: Joi.boolean().required(),
  registration: Joi.number(),
  ocupation: Joi.string().max(20).required(),
  dtUpdate: Joi.string().required(),
});

id = Joi.object({
  id: Joi.number().required(),
});

idUser = Joi.object({
  idUser: Joi.number().required(),
});

module.exports = { payload, id };
