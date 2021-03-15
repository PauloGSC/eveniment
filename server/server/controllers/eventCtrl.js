'use strict'

class EventController {

	constructor(server) {
		this.server = server;
  }

  async create(request, h) {
		try {
			const _eventService = request['services'].EventSrv;
      const _id = await _eventService.create(request.payload);
      
      if (typeof _id != 'number')
        throw { message: 'Erro ao criar evento!'};

      return h.response({
        id: _id,
        message: 'Criado com sucesso!'
      });
    } catch(err) {
      return h.response(err);
    }
  }
}

module.exports = EventController;
