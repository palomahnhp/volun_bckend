    $(document).on('turbolinks:load', function(){
      showOthersNoNested();
      changeActive();
    });
		
    function showOthersNoNested() {
      if ($("#entity_req_reason_id option:selected").html() == $("#others").val()) {
        $("#entity_other_subscribe_reason").parent().parent().show();
      } else {
        $("#entity_other_subscribe_reason").parent().parent().hide();
      }
    }
		
    function changeActive() {
      $("#entity_active").val(!$("#inactive:checkbox:checked").val());
      if($("#inactive:checkbox:checked").val()) {
        var d = new Date();
        var day = d.getDate();
        var month = d.getMonth() + 1;
        var year = d.getFullYear();
        var hours = d.getHours();
        var min = d.getMinutes();
        if (day < 10) {
          day = "0" + day;
        }
        if (month < 10) {
          month = "0" + month;
        }
        var strDate = day + "/" + month + "/" + year + " " + hours + ":" + min;
        $("#entity_unsubscribed_at").val(strDate);
      } else {
        $("#entity_unsubscribed_at").val("");
      }
    }