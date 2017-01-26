class LanguageLevel < ActiveRecord::Base

  include Archivable

  has_many :known_languages, :class_name => 'Volun::KnownLanguage'
  has_many :volunteers, :through => :known_languages

  validates :name, uniqueness: true
  validates :name, presence: true

  def to_s
    name
  end

end
