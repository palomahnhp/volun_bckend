class RequestForm < ActiveRecord::Base

  belongs_to :rt_extendable, polymorphic: true
  belongs_to :request_type
  belongs_to :rejection_type
  has_many :events, as: :eventable

  accepts_nested_attributes_for :rt_extendable


end
