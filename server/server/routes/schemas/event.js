const Joi = require('joi');

payload = Joi.object({
  name: Joi.string().max(99).required(),
  subscriptionLink: Joi.string().max(150),
  description: Joi.string().max(300).required(),
  dtInit: Joi.string().required(),
  dtEnd: Joi.string().required(),
  image: Joi.string(),
  idUser: Joi.number().required(),
});

id = Joi.object({
  id: Joi.number().required(),
});

module.exports = { payload, id };