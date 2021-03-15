const mysql = require('mysql2/promise');
const bluebird = require('bluebird');
const config = require('../../config/local.json');

module.exports = mysql.createConnection({ ...config, Promise: bluebird });