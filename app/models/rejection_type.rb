class RejectionType < ActiveRecord::Base

  include Archivable

  validates :kind, uniqueness: true
  validates :kind, presence: true


end
