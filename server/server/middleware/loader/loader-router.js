'use strict';

const glob = require('glob');
const castArray = require('cast-array');

exports.plugin = {
  multiple: false,
  name: 'router-loader',
  register: async function (server, options, next) {
    const globOptions = {
      nodir: true,
      strict: true,
      cwd: options.cwd || process.cwd(),
      ignore: '**/schema/*'
    };

    castArray(__dirname + '/../../routes/**/*.js').forEach(function (pattern) {
      const files = glob.sync(pattern, globOptions);

      files.forEach(function (file) {
        if (!file.includes('schemas'))
          server.register(require(file));
      });
    });
  }
};
