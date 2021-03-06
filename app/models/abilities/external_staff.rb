module Abilities
  class ExternalStaff
    include CanCan::Ability

    def initialize(user)
      self.merge Abilities::InternalStaff.new(user)

      cannot :manage, Pt::Subvention
    end

  end
end
