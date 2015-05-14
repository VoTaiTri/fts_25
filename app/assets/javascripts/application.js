// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//=require bootstrap
//= require jquery.countdown
//= require jquery.countdown-es

function add_fields(link, assoc, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + assoc, "g")
  $(link).before(content.replace(regexp, new_id));
}

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".form-group").hide();
}

function ready(){
  $(".checkbox").on("change", function(){
    $(".checkbox").not(this).prop("checked", false);
  });

  $("#countdown").countdown({
    until: parseInt($("#duration").val()),
    format: "HMS",
    labels: ["Years", "Months", "weeks", "Days", "Hours", "Minutes", "Seconds"],
    onExpiry: function(){
      alert("Your exam is time out we are going to submit your test automaticaly");
      $("#submit-answer_sheets").trigger("click");
      $("#submit-answer_sheets").hidden();
    }
  });
}

$(document).ready(ready);
$(document).on("page:load", ready);
$(document).on("page:update", ready);
