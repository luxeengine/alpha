'use strict';


var FsTools = require('../');
var Helper = require('./helper');
var Assert = require('assert');
var Fs = require('fs');

var SANDBOX = Helper.SANDBOX_DIR + '/mkdir-sync';

require('vows').describe('mkdirSync()').addBatch({
  'when destination can be created': {
    'should create directory with requested permissions': function () {
      var path = SANDBOX + '/test', stats, err;

      try {
        FsTools.mkdirSync(path, '0711');
        stats = Fs.statSync(path);
      } catch (_err) {
        err = _err;
      }

      Assert.ok(!err, 'There should be no error');
      Assert.isDirectory(stats);
      Assert.hasPermsMode(stats, '0711');
    }
  },
  'when can not create directory, due to permissions of parent': {
    'should raise error': function () {
      var err;

      try {
        FsTools.mkdirSync('/FOOBAR-FS-TOOLS');
      } catch (_err) {
        err = _err;
      }

      Assert.ok(!!err, 'There should be an error');
      Assert.instanceOf(err, Error);
      Assert.equal(err.code, 'EACCES');
    }
  }
}).export(module);
