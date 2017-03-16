// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .
//= require rails.validations.simple_form

$(function(){ $(document).foundation(); });

$(document).ready(function() {

  var client = $("[id*='user_client_id']");
  var consignee = $("[id*='user_consignee_id']");
  var notify = $("[id*='user_notification_id']");

  var clientSelects = $("[id*='user_client_id']").parent();
  var consigneeSelects = $("[id*='user_consignee_id']").parent();
  var notifySelects = $("[id*='user_notification_id']").parent();

  clientSelects.hide();
  consigneeSelects.hide();
  notifySelects.hide();

  var user_type = $("[id*='user_user_type']").val();

    if (user_type == "Client") {
      clientSelects.show();
    }
    else if (user_type == "Consignee"){
      consigneeSelects.show();
    }
    else if (user_type == "Notify"){
      notifySelects.show();
    }

  $("[id*='user_user_type']").change(function() {
    var type = $(this).val();

    if (type == "Client") {
      clientSelects.show();

      consignee.val(null);
      consigneeSelects.hide();

      notify.val(null);
      notifySelects.hide();
    }
    else if (type == "Consignee"){
      consigneeSelects.show();

      client.val(null);
      clientSelects.hide();

      notify.val(null);
      notifySelects.hide();

    }
    else if (type == "Notify"){
      notifySelects.show();

      client.val(null);
      clientSelects.hide();

      consignee.val(null);
      consigneeSelects.hide();
    }
    else{
      client.val(null);
      clientSelects.hide();

      consignee.val(null);
      consigneeSelects.hide();

      notify.val(null);
      notifySelects.hide();
    }
  });
});
