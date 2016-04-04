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

//$.cookie.JSON = true;

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
            console.log(key + " " + this.checked);
            sessionStorage.setItem($(this).attr('name'), this.checked);
        }
    });
    
    persist();
}

function persist(){
    for (var val = 1; val <= 12; val++){
        console.log(sessionStorage.getItem(val));
    }
}

function hide_columns(){
    $('#popup').hide();
    for (var i=0; i <= 12; i++){
        val = sessionStorage.getItem(i);
        console.log(val);
        if (val == "true"){
            
            $('#patients_table td:nth-child('+i+'), #table_header th:nth-child(' + i + ')').removeClass("hidden");
        } else {
            $('type[input=checked] name="' + i + '"').style.checked="false";
            $('#patients_table td:nth-child('+i+'), #table_header th:nth-child(' + i + ')').addClass("hidden");
        }
        
    }
}
