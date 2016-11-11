class ProjectType < ActiveRecord::Base
  include Archivable


  def to_s
    kind
  end

end
