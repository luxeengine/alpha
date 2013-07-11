'use strict';


var FsTools = require('../');
var Helper  = require('./helper');
var Assert  = require('assert');

var SANDBOX = Helper.SANDBOX_DIR + '/find-sorted';

require('vows').describe('findSorted()').addBatch({
  'found files in deirectory': {
    topic: function () {
      FsTools.findSorted(SANDBOX, this.callback);
    },

    'should return sorted list of file': function (err, files) {
      Assert.ok(!err, 'Has no errors');

      files = files.map(function (f) { return f.replace(SANDBOX, ''); });

      Assert.deepEqual(files, [
        '/file',
        '/foo/bar/baz/file',
        '/foo/bar/baz/link',
        '/foo/bar/file',
        '/foo/bar/link',
        '/foo/file',
        '/foo/link',
        '/link'
      ]);
    }
  }
}).export(module);
