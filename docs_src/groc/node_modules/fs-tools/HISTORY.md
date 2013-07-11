0.2.10 / 2013-03-15
-------------------

* Fixed possible callback duplication, if error happens on internal file copy


0.2.9 / 2013-02-17
------------------

* Better tmpdir support - shoud be ok on Win for node 0.8+


0.2.8 / 2013-01-08
------------------

* Added FsTools.walkSync()


0.2.7 / 2012-12-19
------------------

* Added FsTools.mkdirSync()


0.2.6 / 2012-10-15
------------------

* Added FsTools.findSorted()


0.2.5 / 2012-08-21
------------------

* Allows call FsTools.walk() with pathname pointing file.


0.2.4 / 2012-08-19
------------------

* Added FsTools.move()
* Added FsTools.tmpdir()


0.2.3 / 2012-08-09
------------------

* Added FsTools.removeSync() method


0.2.2 / 2012-02-26
------------------

* Update API to be 0.8 compatible with shims for 0.6


0.2.1 / 2012-02-09
------------------

* Really fixed bug #16 with copying over existing dir + added test


0.2.0 / 2012-02-08
------------------

* Fixed bug with fstools.copy() dst directory creation.
* Simplified code.


0.1.1 / 2012-02-06
------------------

* Use `async` instead of `simple-promise`


0.1.0 / 2011-11-24
------------------

* First public release
