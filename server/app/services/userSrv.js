'use strict'

const user = require('../models/user');
const cripto = require('../commons/cripto');
const Config = require('../../config/local.json');
const JWT = require('jsonwebtoken');

class UserSrv {

  constructor(repository) {
    this.repository = repository;
    this.user = user(repository);
  }

  async login(email, password) {
    let token;
    let id, isAdmin;
    let model = await this.user.findOne({
      where: {
        email: email,
        password: cripto.encrypt(password)
      }
    });

    if (model) {
      token = JWT.sign(model.dataValues, Config.authKey)
      id = model.id;
      isAdmin = model.isAdmin;
    }

    return { token, id, isAdmin };
  }

  async findAll() {
    try {
      return await this.user.findAll();
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  async findById(id) {
    try {
      return await this.user.findByPk(id);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  async create(model) {
    try {
      model.password = cripto.encrypt(model.password);
      return await this.user.create(model);
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  async update(model, id) {
    try {
      if (model.password)
        model.password = cripto.encrypt(model.password);

      return await this.user.update(model, {
        where: { id }
      });
    } catch (err) {
      console.log(err);
      return err;
    }
  }

  async delete(id) {
    try {
      return await this.user.destroy({
        where: { id }
      });
    } catch (err) {
      console.log(err);
      return err;
    }
  }
}

module.exports = UserSrv;
