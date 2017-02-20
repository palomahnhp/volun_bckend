class Req::StatusTrace < ActiveRecord::Base

  belongs_to :req_status, :class_name => 'Req::Status'
  belongs_to :request_form
  belongs_to :manager


end
