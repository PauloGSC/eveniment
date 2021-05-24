const { DataTypes } = require('sequelize');
const user = require('./user');

module.exports = (sequelize) => {
  return sequelize.define('event', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: DataTypes.STRING(99),
      allowNull: false
    },
    subscriptionLink: {
      type: DataTypes.STRING(150),
    },
    image: {
      type: DataTypes.STRING(32700),
    },
    description: {
      type: DataTypes.STRING(300),
      allowNull: false
    },
    dtInit: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    dtEnd: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    idUser: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: user(sequelize),
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
