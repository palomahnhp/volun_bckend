class Req::Status < ActiveRecord::Base

  enum kind: {
    pending:    1,
    processing: 2,
    approved:   3,
    rejected:   4
  }

  def to_s
    kind_i18n
  end

end
