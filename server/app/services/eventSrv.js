'use strict'

class EventSrv {

  constructor(repository) {
    this.repository = repository;
  }

  async find(query) {
    try {
      const columns = 'EV.id, EV.name, EV.subscriptionLink, EV.description, EV.dtInit, EV.dtEnd, EV.dtUpdate, EV.image, EV.idUs, SUB.id as idSubscribe';
      const [_models] = await this.repository.execute(`select ${columns} from event as EV left join subscribe as SUB on EV.idUs=SUB.idUs and EV.id=SUB.idEvent and EV.idUs=${query.idUser}`);

      return _models;
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  async create(model) {
    try {
      const columns = Object.keys(model);
      const data = columns.map(key => typeof model[key] == 'string' ? `"${model[key]}"` : model[key]);

      const query = `INSERT INTO event (${columns.join(',')})` +
        ` VALUES (` + data.join(',') + `)`;
      const [response] = await this.repository.execute(query);

      return response.insertId;
    } catch (err) {
      return err;
    }
  }

  async update(model, id) {
    try {
      const columns = Object.keys(model);
      const data = columns.map(key => `${key}=` + (typeof model[key] == 'string' ? `"${model[key]}"` : model[key]));

      const query = `UPDATE event` +
        ` set ` + data.join(',') + ` WHERE id=${id}`;
      const [response] = await this.repository.execute(query);

      return response.info;
    } catch (err) {
      return err;
    }
  }

  async delete(id) {
    try {
      const _query = `DELETE FROM event WHERE id = ${id}`;
      const [response] = await this.repository.execute(_query);

      return response.affectedRows;
    } catch (err) {
      return err;
    }
  }

  async showById(id) {
    try {
      const [_models] = await this.repository.execute('SELECT * FROM event where id=' + id);

      return _models.length ? _models[0] : {};
    } catch (err) {
      return err;
    }
  }
}

module.exports = EventSrv;
