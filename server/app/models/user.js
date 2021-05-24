const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  return sequelize.define('user', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: DataTypes.STRING(99),
      allowNull: false
    },
    password: {
      type: DataTypes.STRING(200),
      allowNull: false
    },
    image: {
      type: DataTypes.CHAR(32700)
    },
    email: {
      type: DataTypes.STRING(200),
      allowNull: false
    },
    isAdmin: {
      type: DataTypes.BOOLEAN,
    },
    registration: {
      type: DataTypes.INTEGER,
    },
    ocupation: {
      type: DataTypes.STRING(20),
      allowNull: false
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
