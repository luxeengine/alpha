'use strict';


var FsTools = require('../');
var Helper = require('./helper');
var Assert = require('assert');

var SANDBOX = Helper.SANDBOX_DIR + '/walk-sync';

require('vows').describe('walk()').addBatch({
  'walking through directory': {
    topic: function () {
      var result = { total: 0, files: 0, symlinks: 0 };

      FsTools.walkSync(SANDBOX, function (path, stats) {
        result.total += 1;

        if (stats.isFile()) {
          result.files += 1;
        }

        if (stats.isSymbolicLink()) {
          result.symlinks += 1;
        }
      });

      return result;
    },
    'calls iterator on all entries': function (result) {
      Assert.equal(result.total, 8);
    },
    'provides lstats info': function (result) {
      Assert.equal(result.files, 4);
      Assert.equal(result.symlinks, 4);
    }
  },

  'walking through directory with pattern': {
    topic: function () {
      var result = 0;

      FsTools.walkSync(SANDBOX, /file$/, function (/*path, stats */) {
        result += 1;
      });

      return result;
    },
    'calls itertor on matching entries only': function (result) {
      Assert.equal(result, 4);
    }
  },

  'walking through the directory that does not exists': {
    topic: function () {
      var result = 0;

      FsTools.walkSync(SANDBOX + '/SHoUldNotExists', function (/*path, stats*/) {
        result += 1;
      });

      return result;
    },
    'silently skipped': function (result) {
      Assert.equal(result, 0);
    }
  },

  'walking through the file': {
    topic: function () {
      var result = { total: 0, files: 0, symlinks: 0 };

      FsTools.walkSync(SANDBOX + '/file', function (path, stats) {
        result.total += 1;

        if (stats.isFile()) {
          result.files += 1;
        }

        if (stats.isSymbolicLink()) {
          result.symlinks += 1;
        }
      });

      return result;
    },
    'calls iterator on exactly one file': function (result) {
      Assert.equal(result.total, 1);
      Assert.equal(result.files, 1);
      Assert.equal(result.symlinks, 0);
    }
  },

  'walking through the file with pattern': {
    topic: function () {
      var result = 0;

      FsTools.walkSync(SANDBOX + '/file', /link$/, function (/*path, stats*/) {
        result++;
      });

      return result;
    },
    'respects given pattern': function (result) {
      Assert.equal(result, 0);
    }
  },
}).export(module);
