'use strict'

const sequelize = require('../commons/repository');
const event = require('../models/event');
const subscribe = require('../models/subscribe');

class EventSrv {

  constructor(repository) {
    this.repository = repository;
    this.event = event(repository);
    this.subscribe = subscribe(repository);
  }

  async findAll(query) {
    try {
      const _columns = 'EV.id, EV.name, EV.subscriptionLink, EV.description, EV.dtInit, EV.dtEnd, EV.updatedAt, EV.image, EV.idUser, SUB.id as idSubscribe';
      const _models = await sequelize.query(`select ${_columns} from events as EV left join subscribes as SUB on EV.id=SUB.idEvent and SUB.idUser=${query.idUser}`);

      return _models[0];
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  async findMyEvents(query) {
    try {
      const _columns = 'EV.id, EV.name, EV.subscriptionLink, EV.description, EV.dtInit, EV.dtEnd, EV.updatedAt, EV.image, EV.idUser, SUB.id as idSubscribe';
      const _models = await sequelize.query(`select ${_columns} from events as EV join subscribes as SUB on EV.id=SUB.idEvent and SUB.idUser=${query.idUser}`);

      return _models[0];
    } catch (err) {
      console.log(err);
      return err;
    }
  }
  async findById(id) {
    try {
      return await this.event.findByPk(id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  async create(model) {
    try {
      return await this.event.create(model);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  async update(model, id) {
    try {

      return await this.event.update(model, {
        where: { id }
      });
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  async delete(id) {
    try {
      await this.subscribe.destroy({
        where: { idEvent: id }
      })
      return await this.event.destroy({
        where: { id }
      });
    } catch (err) {
      return err;
    }
  }
}

module.exports = EventSrv;
