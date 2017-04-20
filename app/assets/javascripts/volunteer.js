    $(document).on('turbolinks:load', function(){
      // Check date fields one time at rendering;
      setAvailDate();
      setAgrmtDate();

      // Clean search values
      resetButton();

      // Search
      searchButton();
      keepSearch();

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

    // Clean search values
    function resetButton() {
      $("#btn-reset").click(function(){
          $('#q_address_district_or_address_postal_code_or_name_or_last_name_or_last_name_alt_or_full_name_or_id_number_or_phone_number_or_phone_number_alt_or_email_or_other_academic_info_cont').prop('value', "");
          $('#q_id_eq').prop('value', "");
          $("#q_address_district_eq").removeAttr('value');
          $(".q_availabilities_day_in_all").removeAttr('value');
          $("#status").removeAttr('value');
          $('.search-form').submit()
      });
    }

    // Search
    function searchButton() {
      $("#btn-search").click(function(){
          $('.q_availabilities_day_in_all').prop('value',$('#availability-select option:selected').val());
          $('#q_address_district_eq').prop('value', $('#district-select option:selected').val());
          $('#status').prop('value', $('#status-select option:selected').val());
          $('.search-form').submit()
      });
    }

    function keepSearch() {
      if ($('#q_address_district_eq').val()) {
          var districtValue = $('#q_address_district_eq').val()
          $('#district-select option[value="' + districtValue + '"]').prop('selected', true)
      };

      if ($('#status').val()) {
          var statusValue = $('#status').val()
          $('#status-select option[value="' + statusValue + '"]').prop('selected', true)
      };

      if ($('.q_availabilities_day_in_all').val()) {
          var availabilityValue = $('.q_availabilities_day_in_all').val()
          $('#availability-select option[value="' + availabilityValue + '"]').prop('selected', true)
      };
    }
