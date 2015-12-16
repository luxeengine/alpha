
var github_milestone_output = function(res, options) {

    var _name = $(options.selector_milestone_name);
    var _issue_count = $(options.selector_milestone_issue_count);
    var _list = $(options.selector_milestone_issue_list);
    var _progress = $(options.selector_milestone_progress);

        //default to the given name
    var ms_name = 'milestone';

        //if there are any issues in this milestone
    if(res.length) {

        //name + issue counts

            var ms_info = res[0].milestone;
                ms_name = ms_info.title;
                ms_name += ' ('+ms_info.state +' - ';

            var ms_issues = '';
            var showing_open = true;
            var showing_closed = true;

            var open_count = $('<a class="issue-count-open" href="#" onclick="return false"></a>');
                $(open_count).text(ms_info.open_issues + ' open');
                $(open_count).on('click', function(){
                    showing_open = !showing_open;
                    $.each( $('.issue-open'), function(index,item){
                        $(item).css('display', showing_open ? 'block' : 'none');
                    });
                });

            var closed_count = $('<a class="issue-count-closed" href="#" onclick="return false"></a>');
                $(closed_count).text(ms_info.closed_issues + ' closed');
                $(closed_count).on('click', function(){
                    showing_closed = !showing_closed;
                    $.each( $('.issue-closed'), function(index,item){
                        $(item).css('display', showing_closed ? 'block' : 'none');
                    });
                });

            $(_issue_count).append(open_count);
            $(_issue_count).append(closed_count);

            var percent = ms_info.closed_issues / (ms_info.open_issues + ms_info.closed_issues);
            var progress = (percent * 100).toFixed(1);
            ms_name += progress + '% complete)';

            $(_progress).css('width', progress+'%');

        //issue list

            for(i = 0; i < res.length; ++i) {
                var issue = res[i];
                // console.log(issue);

                    //#11
                var parent = $('<span class="milestone-list-issue issue-'+issue.state+'"></span>');

                    var assignee = $('<span class="issue-assignee"></span>');

                        if(issue.assignee) {
                            var ulink = $('<a href="'+issue.assignee.html_url+'" target="_blank"></a>')
                            var uimage = $('<img class="issue-assignee-avatar" src="'+issue.assignee.avatar_url+'&s=64"/>');
                            $(ulink).append(uimage);
                            $(assignee).append(ulink);
                        }

                        $(parent).append(assignee);

                    var number = $('<a class="issue-number" href="'+issue.html_url+'" target="_blank">#'+issue.number+'</a>');
                        $(parent).append(number);

                    var title = $('<span class="issue-title">'+issue.title+'</span>');
                        $(parent).append(title);

                    var state = $('<span class="issue-state issue-state-'+issue.state+'"></span>');
                        $(parent).append(state);


                $(_list).append(parent);
            }

        // console.log(ms_info);

    } else {
        $(_issue_count).text('no issues for this milestone');
    }

    $(_name).text(ms_name);

}


var github_milestone_issues_get = function(options) {

    function _fetch_done(res) {

        var err;

        if(res && res.status != 404) {
           github_milestone_output(res, options);
        } else {
            err = 'status:' + res.status;
        }

        if(options.done) {
            options.done(err, res);
        }

    } //_fetch_done

    if(!options.user || !options.repo) {
        return;
    }

    options.milestone = options.milestone || '*';
    options.issue_state = options.issue_state || 'all';
    options.selector_milestone_name = options.selector_milestone_name || '.milestone-name';
    options.selector_milestone_issue_count = options.selector_milestone_issue_count || '.milestone-issue-count';
    options.selector_milestone_issue_list = options.selector_milestone_issue_list || '.milestone-issue-list';
    options.selector_milestone_progress = options.selector_milestone_progress || '.milestone-progress-current';

    $.ajax({ type: "GET",
        url: "https://api.github.com/repos/" + options.user + "/" + options.repo  + "/issues",
        data:{
            milestone : options.milestone,
            state : options.issue_state
        }
    })
        .done(_fetch_done)
        .fail(_fetch_done);

} //get_github_milestone_issues


