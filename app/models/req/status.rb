class Req::Status < ActiveRecord::Base

  enum kind: [:pending, :processing, :approved, :rejected]

end
