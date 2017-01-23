class Skill < ActiveRecord::Base
  include Archivable

  has_and_belongs_to_many :volunteers

  def to_s
    name
  end

end
