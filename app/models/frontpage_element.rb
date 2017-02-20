class FrontpageElement < ActiveRecord::Base
  include Archivable

  belongs_to :frontpage_position


end
