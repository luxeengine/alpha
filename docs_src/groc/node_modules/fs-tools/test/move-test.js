'use strict';


var FsTools = require('../');
var Helper = require('./helper');
var Assert = require('assert');
var Fs = require('fs');


var SANDBOX = Helper.SANDBOX_DIR + '/move';


require('vows').describe('move()').addBatch({
  'moving foo to fuu': {
    topic: function () {
      var callback = this.callback;

      FsTools.move(SANDBOX + '/foo', SANDBOX + '/fuu', function (err) {
        callback(err, SANDBOX + '/fuu');
      });
    },
    'should just work': function (err, dst) {
      dst = dst; // ugly workaround for jshint + vows
      Assert.ok(!err, 'Has no errror');
    },
    'creates directory fuu': function (err, dst) {
      Assert.isDirectory(Fs.statSync(dst));
    },
    'creates file fuu/bar/baz/file': function (err, dst) {
      Assert.isFile(Fs.statSync(dst + '/bar/baz/file'));
    },
    'creates symlink fuu/bar/baz/link': function (err, dst) {
      Assert.isSymbolicLink(Fs.lstatSync(dst + '/bar/baz/link'));
    },
    'creates symlink fuu/bar/baz/link pointing to directory': function (err, dst) {
      Assert.isDirectory(Fs.statSync(dst + '/bar/baz/link'));
    },
    'removes foo': function (err, dst) {
      dst = dst; // ugly workaround for jshint + vows
      Assert.pathNotExists(SANDBOX + '/foo');
    },
    'after all': {
      topic: function () {
        var callback = this.callback, find;

        find = 'find ' + SANDBOX + ' -mindepth 1 -printf %y';

        require('child_process').exec(find, function (err, stdout) {
          callback(err, {
            total: stdout.length,
            files: stdout.match(/f/g).length,
            dirs: stdout.match(/d/g).length,
            syms: stdout.match(/l/g).length
          });
        });
      },
      'fuu has exactly same structure': function (err, result) {
        Assert.ok(!err, 'Has no error');
        Assert.equal(result.total, 11);
        Assert.equal(result.files, 4);
        Assert.equal(result.dirs, 3);
        Assert.equal(result.syms, 4);
      },
    },
  }
}).addBatch({
  'When moving to existing file/dir': {
    topic: function () {
      FsTools.copy(SANDBOX + '/fuu/bar', SANDBOX + '/foo', this.callback);
    },

    'files are overwriten': function (err) {
      var dst, src, result, expected, message;

      dst       = SANDBOX + '/foo/file';
      src       = SANDBOX + '/fuu/bar/file';
      result    = Fs.readFileSync(dst, 'utf8');
      expected  = Fs.readFileSync(src, 'utf8');
      message   = "Expected file '" + dst + "' to be same as '" + src + "'.";

      Assert.ok(!err, 'Has no error');
      Assert.equal(result, expected, message);
    },

    'links are overwriten': 'TBD',

    'directories are merged': function (err) {
      err = err; // ugly workaround for jshint + vows
      Assert.pathExists(SANDBOX + '/foo/baz');
      Assert.isDirectory(Fs.statSync(SANDBOX + '/foo/baz'));
    }
  }
}).export(module);
