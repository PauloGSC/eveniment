'use strict'

const qs = require('qs');

class EventController {

  constructor(server) {
    this.server = server;
  }

  async findAll(request, h) {
    try {
      const _eventSrv = request['services'].EventSrv;
      const _models = await _eventSrv.findAll({
        idUser: request.user.id
      });

      return h.response(_models);
    } catch (err) {
      return h.response(err);
    }
  }

  async findMyEvents(request, h) {
    try {
      const _eventSrv = request['services'].EventSrv;
      const _models = await _eventSrv.findMyEvents({
        idUser: request.user.id
      });

      return h.response(_models);
    } catch (err) {
      return h.response(err);
    }
  }

  async findById(request, h) {
    try {
      const _eventSrv = request['services'].EventSrv;
      const _models = await _eventSrv.findById(request.params.id);
      return h.response(_models);
    } catch (err) {
      return h.response(err);
    }
  }

  async create(request, h) {
    try {
      const _eventSrv = request['services'].EventSrv;
      const _model = await _eventSrv.create(request.payload);

      return h.response(_model);
    } catch (err) {
      return h.response(err);
    }
  }


  async update(request, h) {
    try {
      const _eventSrv = request['services'].EventSrv;
      const _response = await _eventSrv.update(request.payload, request.params.id);

      return h.response({
        message: _response[0] ? 'Atualizado com sucesso!' : 'Não foi possível atualizar!'
      });

    } catch (err) {
      return h.response(err);
    }
  }

  async delete(request, h) {
    try {
      const _eventSrv = request['services'].EventSrv;

      const _response = await _eventSrv.delete(request.params.id);

      return h.response({
        message: _response ? 'Excluido com sucesso!' : 'Não foi possível excluir!'
      });
    } catch (err) {
      return h.response(err);
    }
  }
}

module.exports = EventController;
