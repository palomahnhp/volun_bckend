class Activity < ActiveRecord::Base

  has_many :events, as: :eventable
  has_many :links, as: :linkable
  belongs_to :entity
  belongs_to :area
  belongs_to :project
  
  accepts_nested_attributes_for :events, reject_if: :all_blank, allow_destroy: true

  validates :name, uniqueness: true
  validates :name, :description, :start_date, :transport, presence: true

  scope :all_active,   ->(){ where(active: true) }
  scope :all_inactive, ->(){ where(active: false) }

  def self.main_columns
    %i(id name description start_date end_date transport entity area project share)
  end

  def to_s
    name
  end

end
