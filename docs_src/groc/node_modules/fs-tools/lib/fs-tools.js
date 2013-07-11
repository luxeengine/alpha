/**
 *  FsTools
 *
 *  Collection of FS related tools, that stdlib lack of.
 **/


'use strict';


// stdlib
var fs              = require('fs');
var crypto          = require('crypto');
var os              = require('os');

var _pth            = require('path');

// Node < 0.8 shims
fs.exists = fs.exists || require('path').exists;
fs.existsSync = fs.existsSync || require('path').existsSync;
_pth.sep = _pth.sep || (_pth.resolve('.')[0] === '/' ? '/' : '\\');


var path_join       = _pth.join;
var path_normalize  = _pth.normalize;
var dirname         = _pth.dirname;


// 3rd-party
var async = require('async');
var _     = require('lodash');


// shortcuts
var path_join       = _pth.join;
var path_normalize  = _pth.normalize;
var dirname         = _pth.dirname;


// epxorts: walk, mkdir, copy, remove
var fstools = module.exports = {};


// INTERNAL HELPERS
////////////////////////////////////////////////////////////////////////////////


//  walk_flat(path, iterator, callback) -> void
//  - path (String): Path to iterate through
//  - iterator (Function): Will be fired on each element within `path`
//  - callback (Function): Will be fired once all files were processed
//
//  Walks through given `path` and calls `iterator(path, callback)` for
//  each found entry (regardless to it's type) and waits for all `callback`s
//  (passed to iterator) to be fired. After all callbacks were fired, fires
//  `callback` (given to walk_flat itself).
//
//  NOTICE: It walks through single dimension of file system - it won't go into
//          found sub-directories. See `walk_deep` for this puprpose.
//
//  Example:
//
//    walk_flat('/home/nodeca', function (path, callback) {
//      if ('/home/nodeca/secrets.yml' === path) {
//        callback(Error("There is secrets file."));
//        return;
//      }
//
//      if ('/home/nodeca/xxx' === path) {
//        callback(Error("Path contains some porno?"));
//        return;
//      }
//
//      callback();
//    }, function (err) {
//      if (err) console.error(err);
//      console.log('Done');
//    });
//
function walk_flat(path, iterator, callback) {
  fs.readdir(path, function (err, files) {
    if (err) {
      if (err && 'ENOENT' === err.code) {
        callback(null);
        return;
      }

      callback(err);
      return;
    }

    async.forEach(files, function (file, next) {
      iterator(path_join(path, file), next);
    }, callback);
  });
}


//  walk_deep(path, match, iterator, callback) -> void
//  - path (String): Path to iterate through
//  - match (Function): Path test whenever iterator should be executed or not
//  - iterator (Function): Will be fired on each element within `path`
//  - callback (Function): Will be fired once all files were processed
//
//  Walks through given `path` with all it's nested childs calling
//  `iterator(path, callback)` for each found file.
//
function walk_deep(path, match, iterator, callback) {
  walk_flat(path_normalize(path), function (path, next) {
    fs.lstat(path, function (err, stats) {
      if (err) {
        next(err);
        return;
      }

      if (stats.isDirectory()) {
        walk_deep(path, match, iterator, next);
        return;
      }

      if (match(path)) {
        iterator(path, stats, next);
        return;
      }

      next();
    });
  }, callback);
}


function copy_file(src, dst, callback) {
  var ifd, ofd
    , called = false;

  function done(err) {
    if (!called) {
      callback(err);
      called = true;
    }
  }

  // create streams
  ifd = fs.createReadStream(src, { bufferSize: 64 * 1024 }).on('error', done);
  ofd = fs.createWriteStream(dst).on('error', done).on('close', done);

  // pipe src to dst
  ifd.pipe(ofd);
}


// PUBLIC API
////////////////////////////////////////////////////////////////////////////////


/**
 *  FsTools.walk(path, pattern, iterator, callback) -> void
 *  FsTools.walk(path, iterator, callback) -> void
 *
 *  Walks throught all files withing `path` (including sub-dirs) and calls
 *  `iterator` on each found file (or block device etc.) matching `pattern`.
 *  If no `pattern` was given - will fire call `iterator` for every single
 *  path found. After all iterations will call `callback` (if it was specified)
 *  with passing `error` as first arguemtn if there was an error.
 *
 *  If `path` points a file, iterator will be called against it (respecting
 *  pattern if it was given).
 *
 *
 *  ##### Iterator
 *
 *  All iterations are running within promise. So `callback` given to the `walk`
 *  will fire only after all `iterator` callbacks willnotify they finished their
 *  work:
 *
 *      var iterator = function (path, stats, callback) {
 *        // ... do something
 *        if (err) {
 *          // ... if error occured we can "stop" walker
 *          callback(err);
 *          return;
 *        }
 *        // ... if everything is good and finished notify walker we're done
 *        callback();
 *      };
 *
 *  Iterator is called with following arguments:
 *
 *  - `path` (String): Full path of the found element (e.g. `/foo/bar.txt`)
 *  - `stats` (fs.Stats): Stats object of found path
 *  - `callback` (Function): Callback function to call after path processing
 *
 *
 *  ##### Example
 *
 *      fstools.walk('/home/nodeca', function (path, stats, callback) {
 *        if (stats.isBlockDevice()) {
 *          callback(Error("WTF? Block devices are not expetcted in my room"));
 *          return;
 *        }
 *
 *        if (stats.isSocket()) {
 *          console.log("Finally I found my socket");
 *        }
 *
 *        callback();
 *      }, function (err) {
 *        if (err) {
 *          // shit happens!
 *          console.error(err);
 *          process.exit(1);
 *        }
 *
 *        console.log("Hooray! We're done!");
 *      });
 *
 *
 *  ##### Example (using pattern matching)
 *
 *      fstools.walk('/home/nodeca', '\.yml$', function (path, stats, callback) {
 *        fs.readFile(path, 'utf-8', funtion (err, str) {
 *          if (err) {
 *            callback(err);
 *            return;
 *          }
 *
 *          console.log(str);
 *          callback();
 *        });
 *      }, function (err) {
 *        if (err) {
 *          console.error(err);
 *        }
 *
 *        console.log('Done!');
 *      });
 **/
fstools.walk = function (path, pattern, iterator, callback) {
  var match;

  if (!callback) {
    pattern  = null;
    iterator = arguments[1];
    callback = arguments[2];
  }

  if (!pattern) {
    match = function () { return true; };
  } else if (_.isFunction(pattern) && !_.isRegExp(pattern)) {
    match = pattern;
  } else {
    pattern = new RegExp(pattern);
    match = function (path) { return pattern.test(path); };
  }

  path = path_normalize(path);
  fs.lstat(path, function (err, stats) {
    if (err) {
      callback('ENOENT' === err.code ? null : err);
      return;
    }

    if (stats.isDirectory()) {
      walk_deep(path, match, iterator, callback);
      return;
    }

    if (match(path)) {
      iterator(path, stats, callback);
      return;
    }

    callback();
  });
};



/**
 *  FsTools.walkSync(path, pattern, iterator) -> void
 *  FsTools.walkSync(path, iterator) -> void
 *
 *  Synchronous version of [[FsTool.walk]].
 **/
fstools.walkSync = function (path, pattern, iterator) {
  var match, stat;

  if (!iterator) {
    pattern  = null;
    iterator = arguments[1];
  }

  if (!pattern) {
    match = function () { return true; };
  } else if (_.isFunction(pattern) && !_.isRegExp(pattern)) {
    match = pattern;
  } else {
    pattern = new RegExp(pattern);
    match = function (path) { return pattern.test(path); };
  }

  path = path_normalize(path);

  try {
    stat = fs.lstatSync(path);
  } catch (err) {
    if ('ENOENT' === err.code) {
      return;
    }

    // rethrow
    throw err;
  }

  if (stat.isDirectory()) {
    fs.readdirSync(path).forEach(function (file) {
      fstools.walkSync(path_join(path, file), match, iterator);
    });
    return;
  }

  if (match(path)) {
    iterator(path, stat);
    return;
  }
};


/**
 *  FsTools.remove(path, callback) -> void
 *  - path (String): Path to remove
 *  - callback (Function): Fired after path was removed
 *
 *  Removes given `path`. If it was a directory will remove it recursively,
 *  similar to UNIX' `rm -rf <path>`. After all will fire `callback(err)` with
 *  an error if there were any.
 *
 *  If given `path` was file - will proxy call to `fs.unlink`.
 *
 *
 *  ##### Example
 *
 *      fstools.remove('/home/nodeca/trash', function (err) {
 *        if (err) {
 *          console.log("U can't touch that");
 *          console.err(err);
 *          process.exit(1);
 *        } else {
 *          console.log("It's Hammer time");
 *          process.exit(0);
 *        }
 *      });
 **/
fstools.remove = function (path, callback) {
  path = path_normalize(path);
  fs.lstat(path, function (err, stats) {
    if (err) {
      // file/dir not exists - no need to do anything
      if ('ENOENT' === err.code) {
        callback(null);
        return;
      }

      // unknown error - can't continue
      callback(err);
      return;
    }

    if (!stats.isDirectory()) {
      fs.unlink(path, callback);
      return;
    }

    async.series([
      async.apply(walk_flat, path, fstools.remove),
      async.apply(fs.rmdir, path)
    ], function (err/*, results */) {
      callback(err);
    });
  });
};



/**
 *  FsTools.removeSync(path) -> void
 *  - path (String): Path to remove
 *
 *  Removes given `path`. If it was a directory will remove it recursively,
 *  similar to UNIX' `rm -rf <path>`.
 *
 *  If given `path` was file - will proxy call to `fs.unlinkSync`.
 *
 *
 *  ##### Example
 *
 *      try {
 *        fstools.remove('/home/nodeca/trash');
 *        console.log("It's Hammer time");
 *        process.exit(0);
 *      } catch (err) {
 *        console.log("U can't touch that");
 *        console.err(err);
 *        process.exit(1);
 *      }
 **/
fstools.removeSync = function removeSync(path) {
  var nested_err, lstat;

  path  = path_normalize(path);
  lstat = fs.lstatSync(path);

  if (!lstat.isDirectory()) {
    fs.unlinkSync(path);
    return;
  }

  fs.readdirSync(path).forEach(function (file) {
    try {
      fstools.removeSync(path_join(path, file));
    } catch (err) {
      nested_err = err;
    }
  });

  if (!nested_err) {
    fs.rmdirSync(path);
    return;
  }

  throw nested_err;
};


/**
 *  FsTools.mkdir(path, mode, callback) -> void
 *  FsTools.mkdir(path, callback) -> void
 *  - path (String): Path to create
 *  - mode (String|Number): Permission mode of new directory. See stdlib
 *    fs.mkdir for details. Default: '0755'.
 *  - callback (Function): Fired after path was created
 *
 *  Creates given path, creating parents recursively if needed.
 *  Similar to UNIX' `mkdir -pf <path>`. After all will fire `callback(err)` with
 *  an error if there were any.
 *
 *
 *  ##### Example
 *
 *      fstools.mkdir('/home/nodeca/media/xxx', function (err) {
 *        if (err) {
 *          console.log("Can't' create directory");
 *          console.err(err);
 *          process.exit(1);
 *        } else {
 *          console.log("We can now store some romantic movies here");
 *          process.exit(0);
 *        }
 *      });
 **/
fstools.mkdir = function (path, mode, callback) {
  if (undefined === callback && _.isFunction(mode)) {
    callback = mode;
    mode = '0755';
  }

  path = path_normalize(path);
  fs.exists(path, function (exists) {
    var parent;

    if (exists) {
      callback(null);
      return;
    }

    parent = dirname(path);
    fstools.mkdir(parent, mode, function (err) {
      if (err) {
        callback(err);
        return;
      }

      fs.mkdir(path, mode, function (err) {
        // EEXIST is not error in our case
        // but a race condition :((
        if (err && 'EEXIST' === err.code) {
          callback(null);
          return;
        }

        // fallback to default behavior
        callback(err);
      });
    });
  });
};


/**
 *  FsTools.mkdirSync(path[, mode = '0755']) -> void
 *
 *  Sync version of [[FsTools.mkdir]].
 **/
fstools.mkdirSync = function (path, mode) {
  mode = mode || '0755';
  path = path_normalize(path);

  if (fs.existsSync(path)) {
    return;
  }

  fstools.mkdirSync(dirname(path), mode);

  try {
    fs.mkdirSync(path, mode);
  } catch (err) {
    if ('EEXIST' !== err.code) {
      throw err;
    }
  }
};


/**
 *  FsTools.copy(src, dst, callback) -> void
 *  - src (String): Source file
 *  - dst (String): Destination file
 *  - callback (Function): Fired after path has been copied
 *
 *  Copies `src` to `dst`, creates directory for given `dst` with
 *  [[FsTools.mkdir]] if needed. Fires `callback(err)` upon
 *  completion.
 *
 *
 *  ##### Example
 *
 *      var src = '/home/nodeca/secrets.yml',
 *          dst = '/home/nodeca/very/deep/secrets/main.yml';
 *
 *      fstools.copy(src, dst, function (err) {
 *        if (err) {
 *          console.log("Failed copy " + src + " into " + dst);
 *          console.err(err);
 *          process.exit(1);
 *        } else {
 *          console.log("Done!");
 *          process.exit(0);
 *        }
 *      });
 **/
fstools.copy = function (src, dst, callback) {
  src = path_normalize(src);
  dst = path_normalize(dst);

  // sad but true - people make mistakes...
  if (src === dst) {
    callback(null);
    return;
  }

  fs.lstat(src, function (err, stats) {
    if (err) {
      callback(err);
      return;
    }

    fstools.mkdir(dirname(dst), function (err) {
      var chmod, done;

      if (err) {
        callback(err);
        return;
      }

      // chmod dst
      chmod = async.apply(fs.chmod, dst, stats.mode.toString(8).slice(-4));

      // reject async.series' results
      done = function (err/*, results */) { callback(err); };

      // *** file
      if (stats.isFile()) {
        async.series([async.apply(copy_file, src, dst), chmod], done);
        return;
      }

      // *** symbolic link
      if (stats.isSymbolicLink()) {
        async.waterfall([
          function (next) {
            fs.exists(dst, function (exists) {
              if (exists) {
                fstools.remove(dst, next);
                return;
              }

              next();
            });
          },
          async.apply(fs.readlink, src),
          function (linkpath, next) {
            fs.symlink(linkpath, dst, next);
          },
          chmod
        ], done);
        return;
      }

      // *** directory
      if (stats.isDirectory()) {
        async.series([
          function (next) {
            fs.mkdir(dst, '0755', function (err) {
              if (err && 'EEXIST' === err.code) {
                next(null);
                return;
              }

              next(err);
            });
          },
          async.apply(walk_flat, src, function (path, next) {
            fstools.copy(path, dst + path.replace(src, ''), next);
          }),
          chmod
        ], done);
        return;
      }

      // *** unsupported src
      callback(new Error("Unsupported type of the source"));
    });
  });
};


/**
 *  FsTools.move(source, destination, callback) -> Void
 *  - source (String): Source filename
 *  - destination (String): Destination filename
 *
 *  Moves file from `source` to `destination`.
 **/
fstools.move = function move(source, destination, callback) {
  fs.rename(source, destination, function (err) {
    if (!err) {
      callback();
      return;
    }

    // TODO: Needs testing coverage

    // normally err.code can be:
    // - EXDEV (different partitions/devices)
    // - ENOTEMPTY (source and destination are not-empty dirs)
    // - EISDIR (destionation is dir, source is file)

    async.series([
      async.apply(fstools.copy, source, destination),
      async.apply(fstools.remove, source)
    ], function (err/*, results*/) {
      callback(err);
    });
  });
};


/**
 *  FsTools.tmpdir([template = '/tmp/fstools.XXXXXX']) -> String
 *  - template (String): Temporary directory pattern.
 *
 *  Returns non-existing (at the moment of request) temporary directory path.
 *  `template` must contain a substring with at least 3 consecutive `X`, that
 *  will be replaced with pseudo-random string of the same length.
 *
 *
 *  ##### Example
 *
 *      fstools.tmpdir('/tmp/fooXXX');      // -> '/tmp/fooa2f'
 *      fstools.tmpdir('/tmp/fooXXX');      // -> '/tmp/foocb1'
 *      fstools.tmpdir('/tmp/foo-XXXXXX');  // -> '/tmp/foo-ad25e0'
 **/
fstools.tmpdir = function tmpdir(template) {

  // Default location - in system tmp dir
  var tmp_default = path_join(
    // Just fallback to '/tmp' for node v0.6. Dirty, but better than nothing :)
    os.tmpDir ? os.tmpDir() : '/tmp',
    'fstools.XXXXXX'
  );

  var match = (template || tmp_default).match(/^(.*?)(X{3,})(.*?)$/),
      attempts, length, random, pathname;

  if (!match) {
    throw new Error("Invalid tmpdir template: " + template);
  }

  attempts = 5;
  length   = match[2].length;

  // Do not try more than attempts of times
  while (attempts--) {
    random   = crypto.randomBytes(Math.ceil(length / 2)).toString('hex').substring(0, length);
    pathname = (match[1] || '') + random + (match[3] || '');

    if (!fs.existsSync(pathname)) {
      // Generated pathname is uniq - return it
      return pathname;
    }
  }

  throw new Error("Failed to generate uniq tmpdir with template: " + template);
};


/**
 *  FsTools.findSorted(pathname, pattern, callback(err, files)) -> Void
 *  FsTools.findSorted(pathname, callback(err, files)) -> Void
 *
 *  Finds all files matching `pattern` withing `pathname` (including sub-dirs),
 *  and passes list of found files (sorted alphabethically) to the `callback`.
 *  If no `pattern` was given - will collect all found files.
 **/
fstools.findSorted = function findSorted(pathname, pattern, callback) {
  var files = [];

  if (!callback) {
    callback = pattern;
    pattern  = null;
  }

  fstools.walk(pathname, pattern, function (file, stats, next) {
    files.push(file);
    next();
  }, function (err) {
    callback(err, files.sort());
  });
};
