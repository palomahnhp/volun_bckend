class FrontpagePosition < ActiveRecord::Base
  
  include Archivable
  include Recordable
  
  validates :position, presence: true, uniqueness: true

  def to_s
    position
  end

end
