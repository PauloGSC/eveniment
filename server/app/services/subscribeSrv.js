'use strict'

class SubscribeSrv {

  constructor(repository) {
    this.repository = repository;
  }

  async findAll(query) {
    try {
      const [_models] = await this.repository.execute('SELECT * FROM subscribe');

      return _models;
    } catch (err) {
      return err;
    }
  }

  async create(model) {
    try {
      const columns = Object.keys(model);
      const data = columns.map(key => typeof model[key] == 'string' ? `"${model[key]}"` : model[key]);

      const query = `INSERT INTO subscribe (${columns.join(',')})` +
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

      const query = `UPDATE subscribe` +
        ` set ` + data.join(',') + ` WHERE id=${id}`;
      const [response] = await this.repository.execute(query);

      return response.info;
    } catch (err) {
      return err;
    }
  }

  async delete(id) {
    try {
      const _query = `DELETE FROM subscribe WHERE id = ${id}`;
      const [response] = await this.repository.execute(_query);

      return response.affectedRows;
    } catch (err) {
      return err;
    }
  }

  async showById(id) {
    try {
      const [_models] = await this.repository.execute('SELECT * FROM subscribe where id=' + id);

      return _models.length ? _models[0] : {};
    } catch (err) {
      return err;
    }
  }
}

module.exports = SubscribeSrv;
