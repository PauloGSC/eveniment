'use strict'

const qs = require('qs');

class SubscribeController {

  constructor(server) {
    this.server = server;
  }

  async list(request, h) {
    try {
      const _subscribeService = request['services'].SubscribeSrv;
      const _subscribe = await _subscribeService.findAll();

      return h.response(_subscribe);
    } catch (err) {
      return h.response(err);
    }
  }

  async create(request, h) {
    try {
      const _subscribeService = request['services'].SubscribeSrv;
      const _id = await _subscribeService.create(request.payload);

      if (typeof _id != 'number')
        throw { message: 'Erro ao criar inscrição!' };

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
      const _subscribeService = request['services'].SubscribeSrv;
      const response = await _subscribeService.update(request.payload, params.id);

      if (!response)
        throw { message: 'Erro ao atualizar inscrição!' };

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
      const _subscribeService = request['services'].SubscribeSrv;
      const _response = await _subscribeService.delete(request.params.id);

      if (!_response)
        throw { message: 'Não existe inscrição com o id informado!' };

      return h.response({
        message: 'Excluido com sucesso!'
      });
    } catch (err) {
      return h.response(err);
    }
  }

  async show(request, h) {
    try {
      const _subscribeService = request['services'].SubscribeSrv;
      const _subscribe = await _subscribeService.showById(request.params.id);

      return h.response(_subscribe);
    } catch (err) {
      return h.response(err);
    }
  }
}

module.exports = SubscribeController;
