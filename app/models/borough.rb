class Borough < ActiveRecord::Base
  include Archivable

  belongs_to :district

  def to_s
    name
  end

end
