'use strict';


var FsTools = require('../');
var Assert = require('assert');

require('vows').describe('tmpdir()').addBatch({
  'each time': {
    topic: [ FsTools.tmpdir(), FsTools.tmpdir() ],
    'returns random string': function (result) {
      var a = result.shift(), b = result.shift();

      Assert.isString(a);
      Assert.isString(b);
      Assert.notEqual(a, b);
    }
  },

  'with invalid template': {
    'throws an error': function () {
      Assert.throws(function () {
        FsTools.tmpdir('/foo');
      });
    }
  },

  'with valid template': {
    topic: FsTools.tmpdir('/XXXXXXXXX-XXXX'),
    'Respects length of template': function (result) {
      Assert.equal(15, result.length);
    },
    'respects only first XXX... group': function (result) {
      Assert.match(result, /^\/.{9}-XXXX$/);
    }
  },


}).export(module);
