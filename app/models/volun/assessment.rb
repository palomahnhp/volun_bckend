class Volun::Assessment < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :trait, ->{ where(active: true) }

  validates :volunteer_id, :trait_id, presence: true

end
