class RejectionType < ActiveRecord::Base

  include Archivable

  validates :name, uniqueness: true
  validates :name, presence: true


end
