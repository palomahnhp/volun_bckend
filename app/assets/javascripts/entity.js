		$(document).on('turbolinks:load', function(){
      showOthersNoNested();
    });
		
		function showOthersNoNested() {
      if ($("#entity_req_reason_id option:selected").html() == $("#others").val()) {
        $("#entity_other_subscribe_reason").parent().parent().show();
      } else {
        $("#entity_other_subscribe_reason").parent().parent().hide();
      }
    }