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
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

// jQuery date picker
// $(document).on('ready', function(){
//     $("input.datepicker").datepicker();
// });
// $(document).on('page:load', function(){
//     $("input.datepicker").datepicker();
// });
$(document).on('ready page:load turbolinks:load', function(){
    $('input.datepicker').datepicker({
        format: 'dd-mm-yyyy',
        // autoclose: true,
        // todayHighlight: true,
        // language: 'es'
    });
});
