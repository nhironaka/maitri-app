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
    $("#popup").toggleClass("open");
}

function select_all(field_type){
    $(field_type + '_form').change(function () {
        $(field_type + " input:checkbox").prop('checked', $(this).prop("checked"));
    });
}

function deselect(field_type){
    var selected = true;
    $('input[value=' + field_type + ']').each(function(){
        if (!$(this).prop('checked')){
            selected = false;
            return false;
        }
    });
    $('#' + field_type + "_fields_form").prop('checked', selected);
    sessionStorage(field_type+'_checkbox', selected);
}

function reset(){
    for (var val = 1; val <= 12; val++){
        $('#patients_table td:nth-child('+val+'), #table_header th:nth-child(' + val + ')').removeClass("hidden");
        sessionStorage.setItem(val, true);
    }
}

function get_checkboxes(){
    $('input[type=checkbox]').each(function (){
        var key = $(this).attr('name');
        if (typeof key != "undefined"){
            sessionStorage.setItem($(this).attr('name'), this.checked);
        }
    });
}


function persist(){
    for (var val = 1; val <= 12; val++){
        sessionStorage.getItem(val);
    }
}

function hide_columns(){
    $('#popup').removeClass("open");
    for (var i=0; i <= 12; i++){
        val = sessionStorage.getItem(i);
        if (val == "true" || val == null || $('input:checkbox[name=' + i + ']').checked){
            $('input:checkbox[name=' + i + ']').prop("checked", true);
            $('#patients_table td:nth-child('+i+'), #table_header th:nth-child(' + i + ')').removeClass("hidden");
        } else{
            $('input:checkbox[name=' + i + ']').prop("checked", false);
            $('#patients_table td:nth-child('+i+'), #table_header th:nth-child(' + i + ')').addClass("hidden");
        }
    }
    $('#demographic_fields_form').prop("checked", sessionStorage.getItem('demographic') == false ? false : true);
    $('#social_fields_form').prop("checked", sessionStorage.getItem('social') == false ? false : true);
    $('#medical_fields_form').prop("checked", sessionStorage.getItem('medical') == false ? false : true);
}

