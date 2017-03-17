class Req::StatusTrace < ActiveRecord::Base

  belongs_to :status, :class_name => 'Req::Status', foreign_key: 'req_status_id'
  belongs_to :request_form
  belongs_to :manager


end
