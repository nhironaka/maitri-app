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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function sticky(){
    var patients = document.getElementById("patients_table");
    var top_scroll = patients.scrollTop;
    var elem = document.getElementById("table_header");
    if (top_scroll != 0){
        console.log(top_scroll);
        elem.style.display = "block";
    } else {
        console.log(top_scroll);
        elem.style.display = "none";
    }
}

function popupfilter(){
    $('#popup').toggle();
}

function select_all(field_type){
    $(field_type + '_form').change(function () {
        $(field_type + " input:checkbox").prop('checked', $(this).prop("checked"));
    });
}

function hide_columns(){
    $('#popup').hide();
    $('fieldset input:checked').each(function() {
        var val = $(this).attr('name');
        console.log('td:nth-child('+val+'), th:nth-child(' + val + ')');
        $('#patients_table td:nth-child('+val+'), #patients_table th:nth-child(' + val + ')').show();
    });
    $('fieldset input:checkbox:not(:checked)').each(function() {
        var val = $(this).attr('name');
        console.log('td:nth-child('+val+'), th:nth-child(' + val + ')');
        $('#patients_table td:nth-child('+val+'), #patients_table th:nth-child(' + val + ')').hide();
    });
}

function reset(){
    var val;
    for (val = 1; val <= 12; val++){
        console.log('td:nth-child('+val+'), th:nth-child(' + val + ')');
        $('#patients_table td:nth-child('+val+'), #patients_table th:nth-child(' + val + ')').show();
    }
}