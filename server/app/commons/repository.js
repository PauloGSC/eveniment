const { Sequelize } = require('sequelize');
const config = require('../../config/local.json');

const sequelize = new Sequelize(config.database, config.user, config.password, {
  host: config.host,
  dialect: 'mysql',
});

module.exports = sequelize;