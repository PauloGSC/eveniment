'use strict';

const loadModules = function (dirname) {
  require('fs').readdirSync(dirname).forEach(function (file) {
    if (file.match(/\.js$/) !== null) {
      const str = file.replace('.js', '');
      const model = str.charAt(0).toUpperCase() + str.slice(1);

      module.exports[model] = require(dirname + '/' + file);
    }
  });
}

loadModules(__dirname + '/services');
