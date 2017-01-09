class Technician < ActiveRecord::Base
  include Archivable


  def to_s
    name
  end

end
