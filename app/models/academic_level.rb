class AcademicLevel < ActiveRecord::Base
  include Archivable

  validates :name, uniqueness: true
  validates :name, :educational_type, presence: true

  def to_s
    name
  end

end
