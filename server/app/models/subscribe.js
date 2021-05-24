const { DataTypes } = require('sequelize');
const user = require('./user');
const event = require('./event');

module.exports = (sequelize) => {
  return sequelize.define('subscribe', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    idUser: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: user(sequelize),
        key: 'id',
      }
    },
    idEvent: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: event(sequelize),
        key: 'id',
      }
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: false,
    }
  });
};
