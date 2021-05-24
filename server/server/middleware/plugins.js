'use strict';

let plugins = [
  {
    plugin: require('disinfect'),
    options: {
      disinfectQuery: true,
      disinfectParams: true,
      deleteEmpty: true,
      querySanitizer: (obj) => {
        const keys = Object.keys(obj);
        for (let i = 0; i < keys.length; ++i) {
          if ((obj[keys[i]] == 'null'))
            obj[keys[i]] = '';
        }
        return obj;
      }
    }
  },


  { plugin: require('@hapi/inert') },
  { plugin: require('./loader/loader-router') },
  { plugin: require('./loader/loader-services') },
  { plugin: require('hapi-auth-jwt2') },
];

module.exports = plugins;
