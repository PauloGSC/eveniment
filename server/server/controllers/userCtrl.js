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
        throw { message: 'Erro ao criar cliente!' };

      return h.response({
        id: _id,
        message: 'Criado com sucesso!'
      });
    } catch (err) {
      return h.response(err);
    }
  }

  async update(request, h) {
    try {
      const params = qs.parse(request.query);
      const _userService = request['services'].UserSrv;
      const response = await _userService.update(request.payload, params.id);

      if (!response)
        throw { message: 'Erro ao atualizar usuário!' };

      return h.response({
        id: params.id,
        message: 'Atualizado com sucesso!'
      });
    } catch (err) {
      return h.response(err);
    }
  }

  async delete(request, h) {
    try {
      const _userService = request['services'].UserSrv;
      const _response = await _userService.delete(request.params.id);

      if (!_response)
        throw { message: 'Não existe usuário com o id informado!' };

      return h.response({
        message: 'Excluido com sucesso!'
      });
    } catch (err) {
      return h.response(err);
    }
  }

  async show(request, h) {
    try {
      const _userService = request['services'].UserSrv;
      const _user = await _userService.showById(request.params.id);

      return h.response(_user);
    } catch (err) {
      return h.response(err);
    }
  }
}

module.exports = UserController;
