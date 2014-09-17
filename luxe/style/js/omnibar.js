
$(document).ready(function() {

        //hide by default
    $('#omnibar').hide();

        //if the list is not found, nothing happens
    var list_node = $('#typelist');
    if(list_node.length) {

        var relpath = '';
        var omnibar_visible = false;

        var close_omnibar = function() {
            if(omnibar_visible) {
                omnibar_visible = false;
                $('#omnibar_text').val('');
                $('#omnibar_text').blur();
                $('#omnibar').hide();
                $('#omnibar_text').tooltipster('hide');
            }
        } //close_omnibar

        var focus_omnibar = function() {

            if(!omnibar_visible) {
                omnibar_visible = true;
                $('#omnibar').show();
            }

            $('#omnibar_text').focus();
            $('#omnibar_text').tooltipster('show');

        } //focus_omnibar

            //on any keypress, show if hidden, or focus if showing
        $('body').on('keypress', focus_omnibar);
        $('#search_bar').on('click', focus_omnibar);
        $('#omnibar_close').on('click', close_omnibar);

            //list of types
        var list = list_node.attr('data-types');
            list = list.split(',');
            //fetch the relative path
        relpath = list_node.attr('data-relpath');

            //create the tooltip to display the types
        $('#omnibar_text').tooltipster({

            position : 'bottom',
            trigger : 'click',
            interactive:true,
            minWidth:500,
            content:$('<span>start typing...</span>'),
            theme:'tooltipster-shadow'

        }); //create tooltipster

            //hide on escape
        $('body').on('keyup', function(e) {

            if(e.keyCode == 27) {
                close_omnibar();
            }

        }); //keyup

            //on text input
        $('#omnibar_text').on('input', function(e) {

            var val = $('#omnibar_text').val();

                //if value typed in
            if(val) {

                var results = list.filter(function(a){
                    var reg = new RegExp( val,'gi');
                    return reg.exec(a);
                }); //filter by types

                results = results.map(function(_type){
                    var _link = relpath + 'api/' + _type.replace(/\./gi, '/') + '.html';
                    _type = '<a href="' + _link + '">' + _type + '</a>' ;
                    return _type;
                }); //map to the link types

                if(results.length) {
                    val = results.join('<br/>');
                } else {
                    val = 'no results';
                }

            } else {
                val = 'start typing...';
            }

                //set the content
            $('#omnibar_text').tooltipster('content', $( '<span>' + val + '</span>'));

        }); // input

    } //if list node found

}); //document ready
