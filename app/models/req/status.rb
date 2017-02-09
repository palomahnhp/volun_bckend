class Req::Status < ActiveRecord::Base

  enum kind: {
    pending:    1,
    processing: 2,
    approved:   3,
    rejected:   4
  }

end
