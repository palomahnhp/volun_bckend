class Role < ActiveRecord::Base

  enum kind: [:super_admin, :admin, :internal_staff, :external_staff]

  def to_s
    description
  end

end
