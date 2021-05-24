'use strict'

const qs = require('qs');

class SubscribeController {

  constructor(server) {
    this.server = server;
  }

  async findAll(request, h) {
    try {
      const _subscribeSrv = request['services'].SubscribeSrv;
      const _models = await _subscribeSrv.findAll();

      return h.response(_models);
    } catch (err) {
      return h.response(err);
    }
  }

  async findById(request, h) {
    try {
      const _subscribeSrv = request['services'].SubscribeSrv;
      const _models = await _subscribeSrv.findById(request.params.id);
      return h.response(_models);
    } catch (err) {
      return h.response(err);
    }
  }

  async create(request, h) {
    try {
      const _subscribeSrv = request['services'].SubscribeSrv;
      const _model = await _subscribeSrv.create(request.payload);

      return h.response(_model);
    } catch (err) {
      return h.response(err);
    }
  }


  async update(request, h) {
    try {
      const _subscribeSrv = request['services'].SubscribeSrv;
      const _response = await _subscribeSrv.update(request.payload, request.params.id);

      return h.response({
        message: _response[0] ? 'Atualizado com sucesso!' : 'Não foi possível atualizar!'
      });

    } catch (err) {
      return h.response(err);
    }
  }

  async delete(request, h) {
    try {
      const _subscribeSrv = request['services'].SubscribeSrv;

      const _response = await _subscribeSrv.delete(request.params.id);

      return h.response({
        message: _response ? 'Excluido com sucesso!' : 'Não foi possível excluir!'
      });
    } catch (err) {
      return h.response(err);
    }
  }
}

module.exports = SubscribeController;
