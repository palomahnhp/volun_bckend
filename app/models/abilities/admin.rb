module Abilities
  class SuperAdmin
    include CanCan::Ability

    def initialize(user)
      self.merge Abilities::SuperAdmin.new(user)
      cannot :manage, Setting
    end

  end
end