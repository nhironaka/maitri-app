// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//=require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function synch_scroll(){
    $('#table_header_').scrollLeft($("#patients_table_").scrollLeft());
}

function popupfilter(){
    if ($('#popup').hasClass('open')){
        document.getElementById('popup').style.overflow = "auto";
    } else {
        document.getElementById('popup').style.overflow = "visible";
    }
    $("#popup").toggleClass("open");
}

function backToOverview(){
    window.history.back();
}

function select_all(field_type){
    var checked = true;
    $(field_type + '_form').change(function () {
        checked = $(this).prop("checked");
        $(field_type + " input:checkbox").prop('checked', checked);
    });
    var begin = 1, end = 56; 
    if (field_type === 'demographic'){
        begin = 1; end = 13; 
    } else if (field_type === 'medical'){
        begin = 14;
        end = 47;
    } else {
        begin=48;
        end=56;
    }
    for (i = begin; i <= end; i++){
        sessionStorage.setItem(i, checked);
    }
}

function deselect(field_type){
    var all = true;
    $('input[value=' + field_type + ']').each(function (){
        if (!this.checked){
            all = false;
            return;
        }
    });
    $('#' + field_type + "_fields_form").prop('checked', all);
    sessionStorage.setItem(field_type, all);
}

function reset(){
    for (var val = 1; val <= 56; val++){
        $('#patients_table td:nth-child('+val+'), #table_header th:nth-child(' + val + ')').removeClass("hidden");
        sessionStorage.setItem(val, true);
        $('input[name='+val+']').prop('checked', true);
    }
    $('#demographic_fields_form').prop('checked', true);
    $('#medical_fields_form').prop('checked', true);
    $('#social_fields_form').prop('checked', true);
    persist();
}

function get_checkboxes(){
    $('input[type=checkbox]').each(function (){
        var key = $(this).attr('name');
        if (key !== undefined){
            sessionStorage.setItem(key, this.checked === false ? false : true);
        }
    });
}

function persist(){
    for (var val = 1; val <= 56; val++){
        sessionStorage.getItem(val);
    }
}

function hide_columns(){
    $('#popup').removeClass("open");
    for (var i=1; i <= 56; i++){
        var val = sessionStorage.getItem(i);
        if (val == "true" || val === null || $('input:checkbox[name=' + i + ']').checked){
            $('input:checkbox[name=' + i + ']').prop("checked", true);
            $('#patients_table td:nth-child('+(i+1)+'), #table_header th:nth-child(' + (i+1) + ')').removeClass("hidden");
        } else{
            $('input:checkbox[name=' + i + ']').prop("checked", false);
            $('#patients_table td:nth-child('+(i+1)+'), #table_header th:nth-child(' + (i+1) + ')').addClass("hidden");
        }
    }
    deselect('demographic'); deselect('social'); deselect('medical');
}

function add_filter(){
    
    var len = $( ".selectors" ).length+1;
    console.log(len)
    if (len > 5){
        return;
    }
    len = len.toString();
    var new_filter_div = document.createElement('div');
    new_filter_div.setAttribute('class', 'selectors');
    var clone = $( "#1th_filter" ).first().clone();
    clone.attr('id', len+"th_filter");
    clone.attr('name', len+"th_filter");
    clone.appendTo(new_filter_div);
    
    var new_filter_bounds = document.createElement('span');
    new_filter_bounds.innerHTML=['<select name="'+len+'th_condition" id="'+len+'th_condition"><option value="less_than">&lt;</option>',
                                 '<option value="greater_than">&gt;</option><option value="equal">==</option></select>',
                                 '<input type="text" name="value'+len+'" id="value'+len+'">'].join('');
    new_filter_div.appendChild(new_filter_bounds);
    document.getElementById( "filter_container" ).appendChild(new_filter_div);
}

function show_columns(){
    var len = $( ".selectors" ).length.toString();
    for (var i=1; i <= len; i++){
        var column_head = document.createElement('th');
        var column_val = document.createTextNode($('#'+i+'th_filter option:selected').text());
        column_head.appendChild(column_val);
        document.getElementById('reporting_header').appendChild(column_head);
    }
}
