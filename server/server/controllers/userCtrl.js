'use strict'

const qs = require('qs');

class UserController {

  constructor(server) {
    this.server = server;
  }

  async login(request, h) {
    try {
      const _userSrv = request['services'].UserSrv;
      const _response = await _userSrv.login(request.query.email, request.query.password);

      return h.response({
        token: _response.token,
        idUser: _response.id,
        isAdmin: _response.isAdmin,
        message: _response.token ? 'Login realizado com sucesso!' : 'Senha ou email inválido!',
      });
    } catch (err) {
      return h.response(err);
    }
  }

  async findAll(request, h) {
    try {
      const _userSrv = request['services'].UserSrv;
      const _models = await _userSrv.findAll();

      return h.response(_models);
    } catch (err) {
      return h.response(err);
    }
  }

  async findById(request, h) {
    try {
      const _userSrv = request['services'].UserSrv;
      const _models = await _userSrv.findById(request.params.id);
      return h.response(_models);
    } catch (err) {
      return h.response(err);
    }
  }

  async create(request, h) {
    try {
      const _userSrv = request['services'].UserSrv;
      const _model = await _userSrv.create(request.payload);


      return h.response(_model);
    } catch (err) {
      return h.response(err);
    }
  }


  async update(request, h) {
    try {
      const _userSrv = request['services'].UserSrv;
      const _response = await _userSrv.update(request.payload, request.params.id);

      return h.response({
        message: _response[0] ? 'Atualizado com sucesso!' : 'Não foi possível atualizar!'
      });

    } catch (err) {
      return h.response(err);
    }
  }

  async delete(request, h) {
    try {
      const _userSrv = request['services'].UserSrv;

      const _response = await _userSrv.delete(request.params.id);

      return h.response({
        message: _response ? 'Excluido com sucesso!' : 'Não foi possível excluir!'
      });
    } catch (err) {
      return h.response(err);
    }
  }
}

module.exports = UserController;
