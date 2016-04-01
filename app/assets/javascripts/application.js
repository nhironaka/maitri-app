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

function synch_scroll(){
    $('#table_header_').scrollLeft($("#patients_table_").scrollLeft());
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
        $('#patients_table td:nth-child('+val+'), #table_header th:nth-child(' + val + ')').removeClass("hidden");
    });
    $('fieldset input:checkbox:not(:checked)').each(function() {
        var val = $(this).attr('name');
        console.log(val);
        $('#patients_table td:nth-child('+val+')').addClass("hidden");
        $('#table_header th:nth-child(' + val + ')').addClass("hidden")
    });
}

function reset(){
    var val;
    for (val = 1; val <= 12; val++){
        $('#patients_table td:nth-child('+val+'), #table_header th:nth-child(' + val + ')').removeClass("hidden");
    }
}

function date_filterer() {
    $("#date_filter").submit();
    $(document).ready(function() {
  return $("#date_filter").on("ajax:success", function(e, data, status, xhr) {
    $("#patients_renderer").append(xhr.responseText);
  }).on("ajax:error", function(e, xhr, status, error) {
    return $("#date_filter").append("<p>ERROR</p>");
  });
});
}

function submit_filters() {
    hide_columns();
}