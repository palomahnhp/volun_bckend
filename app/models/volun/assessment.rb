class Volun::Assessment < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :trait
  belongs_to :project


end
