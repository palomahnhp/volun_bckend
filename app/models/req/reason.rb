class Req::Reason < ActiveRecord::Base

  include Archivable

  validates :name, :description, uniqueness: true
  validates :name, presence: true

end
