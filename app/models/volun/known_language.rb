class Volun::KnownLanguage < ActiveRecord::Base

  belongs_to :volunteer, required: true
  belongs_to :language, required: true
  belongs_to :language_level, required: true

end
