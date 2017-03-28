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
//= require jquery-ui/datepicker
//= require jquery-ui/datepicker-es
//= require jquery-ui/dialog
//= require jquery-ui/autocomplete
//= require jquery_nested_form
//= require turbolinks
//= require bootstrap-sprockets
//= require inputmask
//= require_tree .



$(document).on('ready page:load turbolinks:load nested:fieldAdded', function(){
    $( "input.datepicker" ).datepicker({
        onSelect: function () {
            $(this).next('input[type="hidden"]').attr('value', this.value);
        }
    });
});

var confirm_submit = function (msg) {
    $('.js-confirmable').closest('form').submit(function() {
        var message = (msg === undefined) ? 'Are you sure?' : msg;
        var c = confirm(message);
        return c;
    });
};

var confirm_reload = function (msg) {
    $('.js-reloadable').click(function() {
        var message = (msg === undefined) ? 'Are you sure?' : msg;
        var c = confirm(message);
        if (c == true)
            return window.location.reload();
        else
            return false;
    });
};

var confirm_undo = function (msg) {
    confirm_reload(msg);
};


$( document ).ready(function() {

    // hide spinner
    $(".spinner").hide();

    // show spinner on AJAX start
    $(document).ajaxStart(function(){
        $(".spinner").show();
    });

    // hide spinner on AJAX stop
    $(document).ajaxStop(function(){
        $(".spinner").delay(500).hide(0);
    });

    //reset button
    $("#btn-reset").click(function(){
        $('#q_address_district_or_address_postal_code_or_name_or_last_name_or_last_name_alt_or_full_name_or_id_number_or_phone_number_or_phone_number_alt_or_email_or_comments_or_expectations_or_other_academic_info_cont').prop('value', "");
        $('.search-form').submit()
    });

});

var update_hidden_inputs = function(elem, selector){
    if(elem.value)
        $(selector).prop('value', elem.checked);
    $('.search-form').submit();
}
