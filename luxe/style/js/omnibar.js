$(document).ready(function() {
    var relpath = '';
    var omnibar_visible = false;
    $('body').on('keyup', function(e) {
        if(e.keyCode == 27) {
            if(omnibar_visible) {
                omnibar_visible = false;
                $('#omnibar_text').val('');
                $('#omnibar_text').blur();
                $('#omnibar').hide();
                $('#omnibar_text').tooltipster('hide');
            }
        }
    });
    $('body').on('keypress', function(e) {
        if(!omnibar_visible) {
            omnibar_visible = true;
            $('#omnibar').show();
        }
        $('#omnibar_text').focus();
        $('#omnibar_text').tooltipster('show');
    });
    $('#omnibar').hide();
    var list_node = $('#typelist');
    if(list_node.length) {
        var list = list_node.attr('data-types');
        relpath = list_node.attr('data-relpath');
            list = list.split(',');
        var c = 'start typing...';
        $('#omnibar_text').tooltipster({
            position : 'bottom',
            trigger : 'click',
            interactive:true,
            minWidth:500,
            content:$('<span>' + c + '</span>'),
            theme:'tooltipster-shadow'
        });

        $('#omnibar_text').on('input', function(e) {
            var val = $('#omnibar_text').val();
            if(val) {
                var results = list.filter(function(a){
                    var reg = new RegExp( val,'gi');
                    if(reg.exec(a)) {
                        return a;
                    }
                });
                results = results.map(function(a){
                    var _link = relpath + 'api/' + a.replace(/\./gi, '/') + '.html';
                    var _type = a;
                    a = '<a href="' + _link + '">' + _type + '</a>' ;
                    return a;
                });
                if(results.length) {
                    val = results.join('<br/>');
                } else {
                    val = 'no results';
                }
            } else {
                val = 'start typing...';
            }
            $('#omnibar_text').tooltipster('content', $( '<span>' + val + '</span>'));
        });
    }
});
