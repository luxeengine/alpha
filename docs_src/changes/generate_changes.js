
var git 		= require('nodegit'),
	wrench      = require('wrench'),
	path        = require('path'),
	fs        	= require('graceful-fs');

	var project_git_url = 'https://github.com/underscorediscovery.com/luxe/';
	var md_path = '../luxe/md/';
	
	var write_file = function(_dest, _content) {

        fs.writeFileSync( path.resolve('.', _dest) , _content );

    } //write_file

	var generate_changes = function(_done) {

        git.Repo.open(path.resolve(__dirname, '../../.git'), function(error, repo) {
          if (error) throw error;

          repo.getMaster(function(error, branch) {
            if (error) throw error;

            // History returns an event.
            var history = branch.history(git.RevWalk.Sort.Time);

                // History emits 'commit' event for each commit in the branch's history
                // history.on('commit', function(commit) {
                //   console.log('commit ' + commit.sha());
                //   console.log('Author:', commit.author().name() + ' <' + commit.author().email() + '>');
                //   console.log('Date:', commit.date());
                //   console.log('\n    ' + commit.message());
                // });

                history.on('end', function(all){
                    
                    var _final_log = '';

                    var _count = all.length;
                    for(i = 0; i < _count; ++i) {
                        _commit = all[i];

                        _final_log += '&nbsp;   \n';

                        _final_log += '<div class="commit_info">\n\n';
                        _final_log += 'commit ['+ String(_commit.sha()).substr(0,10) +'](' + project_git_url + 'commit/'+ _commit.sha() +')   \n';
                        _final_log += 'author: ' + _commit.author().name() + '   \n';
                        _final_log += 'date: ' + _commit.date() + '   \n';
                        _final_log += '</div>\n\n';
                        _final_log += '&nbsp;   \n';                        
                        _final_log += '<div class="commit_message">\n\n<ul>';
                            
                        _items = _commit.message().split('\n');
                        for(var j = 0; j < _items.length; ++j) {
                            if(_items[j].length > 0) {
                                _final_log += '<li>' + _items[j] + '</li>';
                            }
                        }                        

                        _final_log += '</ul>\n</div>\n';
                        _final_log += '&nbsp;   \n';
                    }

                    write_file( md_path + 'changes.md' , _final_log );

                    _done();

                });

            		// Don't forget to call `start()`!
            	history.start();

          	}); //get master

        }); //repo open

	} //generate_changes

	console.log("generating changes.md at " + md_path + ' to changes.md');
	generate_changes(function(){
		console.log('done');
	});

