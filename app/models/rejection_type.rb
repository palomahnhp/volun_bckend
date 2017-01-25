class RejectionType < ActiveRecord::Base

  include Archivable

  validates :kind, uniqueness: true
  validates :kind, :active, presence: true


end
