module AddressHelper
  
  # Projects addresses must be always normalized
  def hide_no_bdc_check_field
     /\APt::*/ === controller.class.name
  end
  
end