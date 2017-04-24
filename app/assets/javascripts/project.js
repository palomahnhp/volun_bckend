$(document).on('turbolinks:load', function() {

    setInsurDate();

    $('.urls_block.js-files-block').on('nested:fieldAdded', function (event) {
        var $newAddedFile = $(this).find('.js-file-fields:last .js-file-link a.js-visit');
        $newAddedFile.hide();
    });

//         $('.js-arrow').click(function () {
//            $(this).children('span').toggleClass('hidden');
//            $('#files .files-block').toggle(500);
//        })
});

function checkElementNotInArray(elementToFind, array) {
  var params = {id: elementToFind, notFound: true};
  array.forEach(function(element) {
    if (element.id == this.id) {
      this.notFound = false;
    }
  }.bind(params));
  return params.notFound;
}

function filterImportance(checkId) {
  $.ajax({
    url: "/projects",
    dataType: 'json',
    success: function (data) {
      if (checkId == 'urgent') {
        if (data.urgent.length > 0) {
          data.urgent.forEach(function(element) {
            if (element.urgent && (element.id != $("#project_id").val())) {
              swal($("#message_title_urgent").val(), $("#message_body_urgent").val() + ': \'' + element.name + '\'', 'error');
              $('#urgent').prop('checked', false);
              return;
            }
          });
        }
      }
      if (checkId == 'outstanding') {
        if (data.outstanding.length > 2) {
          projects = "";
          data.outstanding.forEach(function(element) {
            if (element.id != $("#project_id").val()) {
              projects += element.name;
              if (data.outstanding.indexOf(element) != data.outstanding.length-1) {
                projects += "', '";
              }
            }
          });
          if (projects.length > 2 && checkElementNotInArray($("#project_id").val(), data.outstanding)) {
            swal($("#message_title_outstanding").val(), $("#message_body_outstanding").val() + ': \'' + projects + '\'', 'error');
            $('#outstanding').prop('checked', false);
            return;
          }
        }
      }
      return {results: data};
    }
  });
}

// Disable insurance_date if available check is checked
function setInsurDate() {
  if ($('[id$="_attributes_insured"]').prop("checked")) {
    $('[id$="_attributes_insurance_date"]').attr("disabled", false);
  } else {
    $('[id$="_attributes_insurance_date"]').attr("disabled", true);
    $('[id$="_attributes_insurance_date"]').val("");
  }
}