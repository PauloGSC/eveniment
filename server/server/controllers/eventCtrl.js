'use strict'

const qs = require('qs');

class EventController {

  constructor(server) {
    this.server = server;
  }

  async list(request, h) {
    try {
      const params = qs.parse(request.query);
      const _eventService = request['services'].EventSrv;
      const events = await _eventService.find(params);

      return h.response(events);
    } catch (err) {
      return h.response(err);
    }
  }

  async create(request, h) {
    try {
      const _eventService = request['services'].EventSrv;
      const _id = await _eventService.create(request.payload);

      if (typeof _id != 'number')
        throw { message: 'Erro ao criar evento!' };

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
      const _eventService = request['services'].EventSrv;
      const response = await _eventService.update(request.payload, params.id);

      if (!response)
        throw { message: 'Erro ao atualizar evento!' };

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
      const _eventService = request['services'].EventSrv;
      const _response = await _eventService.delete(request.params.id);

      if (!_response)
        throw { message: 'Não existe evento com o id informado!' };

      return h.response({
        message: 'Excluido com sucesso!'
      });
    } catch (err) {
      return h.response(err);
    }
  }

  async show(request, h) {
    try {
      const _eventService = request['services'].EventSrv;
      const event = await _eventService.showById(request.params.id);

      return h.response(event);
    } catch (err) {
      return h.response(err);
    }
  }
}

module.exports = EventController;
