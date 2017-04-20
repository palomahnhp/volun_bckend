module Abilities
  class Admin
    include CanCan::Ability

    def initialize(user)
      self.merge Abilities::SuperAdmin.new(user)
      cannot :manage, Manager, id: user.loggable_id
      cannot :manage, Setting
      cannot [:create, :update, :destroy], Resource
    end

  end
end