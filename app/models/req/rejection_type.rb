class Req::RejectionType < ActiveRecord::Base

  include Recordable
  include Archivable

  validates :name, uniqueness: true
  validates :name, presence: true


  def to_s
    name
  end

end
