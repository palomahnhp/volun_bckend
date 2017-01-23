class RequestReason < ActiveRecord::Base

  include Archivable
  has_many :rt_entity_subscribes, :class_name => 'Rt::EntitySubscribe'

end
