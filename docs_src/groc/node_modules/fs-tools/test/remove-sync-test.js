'use strict';


var FsTools = require('../');
var Helper = require('./helper');
var Assert = require('assert');

var SANDBOX = Helper.SANDBOX_DIR + '/remove-sync';

require('vows').describe('removeSync()').addBatch({
  'removing single file': {
    topic: function () {
      try {
        FsTools.removeSync(SANDBOX + '/foo/bar/baz/file');
        this.callback(null);
      } catch (err) {
        this.callback(err);
      }
    },
    'removes exactly one file': function (err) {
      Assert.ok(!err, 'Has no error');
      Assert.pathNotExists(SANDBOX + '/foo/bar/baz/file');
      Assert.pathExists(SANDBOX + '/foo/bar/baz');
      Assert.pathExists(SANDBOX);
    }
  },

  'removing symbolic link': {
    topic: function () {
      try {
        FsTools.removeSync(SANDBOX + '/foo/bar/baz/link');
        this.callback(null);
      } catch (err) {
        this.callback(err);
      }
    },
    'removes symbolic link, and not the file/dir it points to': function (err) {
      Assert.ok(!err, 'Has no error');
      Assert.pathNotExists(SANDBOX + '/foo/bar/baz/link');
      Assert.pathExists(SANDBOX + '/foo/bar/baz');
      Assert.pathExists(SANDBOX);
    }
  }
}).addBatch({
  'removing directory': {
    topic: function () {
      try {
        FsTools.removeSync(SANDBOX);
        this.callback(null);
      } catch (err) {
        this.callback(err);
      }
    },
    'removes directory recursively': function (err) {
      Assert.ok(!err, 'Has no error');
      Assert.pathNotExists(SANDBOX);
    }
  }
}).export(module);
