class FrontpageElement < ActiveRecord::Base
  
  include Archivable
  include Recordable

  belongs_to :frontpage_position, required: true
  
  validates :frontpage_position_id, uniqueness: true

end
