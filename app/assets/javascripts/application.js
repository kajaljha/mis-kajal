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
// require turbolinks
//= require bootstrap.min
// require slidebars.min
//= require jquery.dataTables
//= require bootstrap-datepicker
// require sliders
//= require_self
//= require jquery_nested_form


var jQuery = $.noConflict();

jQuery(function() {
  // jQuery("#users th a, #users .pagination a").live("click", function() {
  //   jQuery.getScript(this.href);
  //   return false;
  // });
  jQuery("#users_search input").keyup(function() {
    jQuery.get(jQuery("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
    return false;
  });
});