'use strict'

const subscribe = require('../models/subscribe');

class SubscribeSrv {

  constructor(repository) {
    this.repository = repository;
    this.subscribe = subscribe(repository);
  }

  async findAll() {
    try {
      return await this.subscribe.findAll();
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  async findById(id) {
    try {
      return await this.subscribe.findByPk(id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  async create(model) {
    try {
      return await this.subscribe.create(model);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  async update(model, id) {
    try {
      if (model.password)
        model.password = cripto.encrypt(model.password);

      return await this.subscribe.update(model, {
        where: { id }
      });
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  async delete(id) {
    try {
      return await this.subscribe.destroy({
        where: { id }
      });
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

module.exports = SubscribeSrv;
