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
    $(field_type + '_form').change(function () {
        $(field_type + " input:checkbox").prop('checked', $(this).prop("checked"));
    });
}

function deselect(field_type){
    var all = true;
    $('input[value=' + field_type + ']').each(function (){
        if (!this.checked){
            all = false;
            return;
        }

function hide_columns(){
    $('#popup').hide();
    $('fieldset input:checked').each(function() {
        var val = $(this).attr('name');
        console.log('td:nth-child('+val+'), th:nth-child(' + val + ')');
        $('#patients_table td:nth-child('+val+'), #table_header th:nth-child(' + val + ')').show();
    });
    $('fieldset input:checkbox:not(:checked)').each(function() {
        var val = $(this).attr('name');
        if (window.localStorage) {
            window.localStorage.setItem(val, val);
        }
        // console.log('td:nth-child('+val+'), th:nth-child(' + val + ')');
        // $('#patients_table td:nth-child('+val+'), #table_header th:nth-child(' + val + ')').hide();
    });
    $('#' + field_type + "_fields_form").prop('checked', all);
    sessionStorage.setItem(field_type, all);
}

function reset(){
    for (var val = 1; val <= 12; val++){
        $('#patients_table td:nth-child('+val+'), #table_header th:nth-child(' + val + ')').removeClass("hidden");
        sessionStorage.setItem(val, true);
        $('input[name='+val+']').prop('checked', true);
    }
    $('#demographic_fields_form').prop('checked', true);
    ('#medical_fields_form').prop('checked', true);
    ('#social_fields_form').prop('checked', true);
}

<<<<<<< HEAD
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
    deselect('demographic'); deselect('social'); deselect('medical');
=======
function date_filterer() {
    $("#date_filter").submit();
    $('fieldset input:checked').each(function() {
        var val = $(this).attr('name');
        if(window.localStorage.getItem(val)) {
            $('#patients_table td:nth-child('+val+'), #table_header th:nth-child(' + val + ')').hide();
        }
    });
}

function submit_filters() {
    hide_columns();
    date_filterer();
>>>>>>> trying to add localstorage, works but doesn't work
}