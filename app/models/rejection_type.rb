class RejectionType < ActiveRecord::Base

  include Recordable
  include Archivable

  validates :name, uniqueness: true
  validates :name, presence: true


end
