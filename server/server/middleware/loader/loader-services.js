'use strict';

const _ = require('lodash');
const Services = require('../../../app/services-eveniment');
const repository = require('../../../app/commons/repository')
const buildConditions = require('../../../app/commons/buildConditions')

exports.plugin = {
  name: 'services',
  version: '1.0.0',
  register: async function (server, options, next) {
    let _repository = await repository;
    _repository.buildConditions = buildConditions;
    
    function getFnName(fn) {
      const f = typeof fn == 'function';
      const s = f && ((fn.name && ['', fn.name]) || fn.toString().match(/function ([^\(]+)/));
      return (!f && 'not a function') || (s && s[1] || 'anonymous');
    }

    function loadServices(request) {
      _.forOwn(Services, (key, value) => {
        request['services'][getFnName(key)] = new key(_repository);
      })
    }

    server.ext('onRequest', function (request, h) {
      request['services'] = {};
      loadServices(request);
    
      return h.continue;
    });
  }
};
