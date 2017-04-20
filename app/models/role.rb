class Role < ActiveRecord::Base

  enum kind: [:super_admin, :admin, :internal_staff, :external_staff]

  scope :non_super_admin, ->{ where(kind: kinds.except(:super_admin).values) }

  def is_administrator?
    admin? || super_admin?
  end

  def to_s
    kind_i18n
  end

end
