    $(document).on('turbolinks:load', function(){
      // Check date fields one time at rendering;
      setAvailDate();
      setAgrmtDate();
      // Show others comment fields on traits
      $.each($('[id^="volunteer_assessments_attributes"][id$="trait_id"]'), function( index, value ) {
        showComments(value.id)
      });
      $.each($('[id^="volunteer_assessments_projects_attributes"][id$="trait_id"]'), function( index, value ) {
        showComments(value.id)
      });
    });

    // Select jQuery for degrees filtering
    function filterDegree(degreeTypeId) {
      degreeId = degreeTypeId.split("_degree_type_id")[0] + "_name";
      dt_id = $("#" + degreeTypeId + " option:selected").val();
      $.ajax({
        url: "/volunteers",
        dataType: 'json',
        data: {
            dt_id: dt_id
        },
        success: function (data) {
          $("#"+degreeId).empty();
          data.forEach(function(element) {
            $("#"+degreeId).append("<option value='" + element.name + "'>" + element.name + "</option>");
          });
          return {results: data};
        }
      });
    }

    // Disable availability_date if available check is checked
    function setAvailDate() {
      if ($("#volunteer_available").prop("checked")) {
        $("#volunteer_availability_date").attr("disabled", true);
        $("#volunteer_availability_date").val("");
      } else {
        $("#volunteer_availability_date").attr("disabled", false);
      }
    }

    // Disable agreement_date if available check is checked
    function setAgrmtDate() {
      if (!$("#volunteer_agreement").prop("checked")) {
        $("#volunteer_agreement_date").attr("disabled", true);
        $("#volunteer_agreement_date").val("");
      } else {
        $("#volunteer_agreement_date").attr("disabled", false);
      }
    }

    // Show field others in assessments
    function showComments(selId) {
      otherId = selId.split("_id")[0] + "_other";
      if ($("#"+selId+" option:selected").html() == $("#others").val()) {
        $("#"+otherId).parent().parent().show();
      } else {
        $("#"+otherId).parent().parent().hide();
      }
    }
