class RequestForm < ActiveRecord::Base

  belongs_to :request_type
  belongs_to :rejection_type


end
