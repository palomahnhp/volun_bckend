class Activity < ActiveRecord::Base

  has_many :events, as: :eventable
  has_many :links, as: :linkable
  belongs_to :entity
  belongs_to :area
  belongs_to :project

  def to_s
    name
  end

end
