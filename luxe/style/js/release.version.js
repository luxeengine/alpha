
var get_github_latest_release = function(options) {

    function _fetch_done(res) {

        var err;

        if(res && res.status != 404 && res.length) {
            var release = res[0];

            var _release_date = new Date(release.published_at);
                _release_date = _release_date.toUTCString();

            if(options.selector_tag) {
                var node = $(options.selector_tag);
                if(node.length) {
                        //set the attribute the download
                    node.attr('href', release.html_url);
                    node.attr('title', _release_date );
                    node.text(release.tag_name);
                }
            }

            if(options.selector_notes_link) {
                var node = $(options.selector_notes_link);
                if(node.length) {
                    node.attr('href', release.html_url);
                }
            }

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

    $.ajax({ type: "GET", url: "https://api.github.com/repos/" + options.user + "/" + options.repo  + "/releases"  })
     .done(_fetch_done)
     .fail(_fetch_done);

} //get_latest_release_version

$(document).ready(function() {

    get_github_latest_release({
        user:'underscorediscovery',
        repo:'hxcollision',
        selector_notes_link:'#version_notes_link',
        selector_tag:'#version_tag',
        done : function() {
            $('#version_tag').tooltipster({ theme:'tooltipster-shadow' });
        }
    });

});