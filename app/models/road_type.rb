class RoadType < ActiveRecord::Base
  include Archivable


  def to_s
    name
  end

end
