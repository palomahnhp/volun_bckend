class Volun::KnownLanguage < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :language
  belongs_to :language_level

end
