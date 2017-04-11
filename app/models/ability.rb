class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    can :manage, :all

    # case user.manager
    # manager =
    case user.loggable
    when ->(manager){ manager.super_admin? }
      self.merge Abilities::SuperAdmin.new(user)

    when ->(manager){ manager.admin? }
      self.merge Abilities::Admin.new(user)

    when ->(manager){ manager.internal_staff? }
      self.merge Abilities::InternalStaff.new(user)

    when ->(manager){ manager.external_staff? }
      self.merge Abilities::ExternalStaff.new(user)

    else
      cannot :manage, :all
    end

  end

end
