class Role < ActiveRecord::Base

  enum kind: [:super_admin, :admin, :internal_staff, :external_staff]

  def is_administrator?
    admin? || super_admin?
  end

  def to_s
    description
  end

end
