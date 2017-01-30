class Volun::Contact < ActiveRecord::Base

  belongs_to :volunteer
  belongs_to :contact_result
  belongs_to :project
  belongs_to :manager

  validates :name, uniqueness: true
  validates :volunteer_id, :contact_result_id, :project_id, :manager_id, :contact_date, presence: true

end
