class LanguageLevel < ActiveRecord::Base

  include Archivable

  has_many :known_languages, :class_name => 'Volun::KnownLanguage'
  has_many :volunteers, :through => :known_languages

  def to_s
    name
  end

end
