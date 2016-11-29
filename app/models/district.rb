class District < ActiveRecord::Base

  has_and_belongs_to_many :projects

  validates :name, :code, uniqueness: true

  def to_s
    name
  end

end
