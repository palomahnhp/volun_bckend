class District < ActiveRecord::Base

  has_many :addresses

  validates :name, :code, uniqueness: true

  def to_s
    name
  end

end
