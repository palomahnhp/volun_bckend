class Req::Reason < ActiveRecord::Base

  include Archivable

  validates :name, :description, uniqueness: true
  validates :name, presence: true

  def to_s
    description
  end

end
