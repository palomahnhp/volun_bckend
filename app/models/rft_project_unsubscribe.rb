class RftProjectUnsubscribe < ActiveRecord::Base

  belongs_to :request_form_type
  belongs_to :entity
  belongs_to :project


end
