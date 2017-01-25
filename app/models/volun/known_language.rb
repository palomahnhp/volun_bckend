class Volun::KnownLanguage < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :language
  belongs_to :language_level

  validates :volunteer_id, :language_id, :language_level_id, presence: true

end
