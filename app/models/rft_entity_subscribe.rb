class RftEntitySubscribe < ActiveRecord::Base

  belongs_to :request_form_type
  belongs_to :entity

  def to_s
    name
  end

end
