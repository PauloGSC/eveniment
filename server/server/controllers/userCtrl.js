'use strict'

const qs = require('qs');

class UserController {

	constructor(server) {
		this.server = server;
  }

  async create(request, h) {
		try {
			const _clientService = request['services'].UserSrv;
      const _id = await _clientService.create(request.payload);
      
      if (typeof _id != 'number')
        throw { message: 'Erro ao criar cliente!'};

      return h.response({
        id: _id,
        message: 'Criado com sucesso!'
      });
    } catch(err) {
      return h.response(err);
    }
  }
}

module.exports = UserController;
