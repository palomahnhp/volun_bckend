class Proposal < ActiveRecord::Base

  include Archivable

  validates :name, presence: true

  has_many :pt_subventions

  def to_s
    name
  end

end
