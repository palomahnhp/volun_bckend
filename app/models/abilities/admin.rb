module Abilities
  class Admin
    include CanCan::Ability

    def initialize(user)
      self.merge Abilities::SuperAdmin.new(user)

      cannot :manage, Manager, role_id: Role.super_admin.take.id
      cannot :create, Manager
      cannot :manage, Setting
      cannot :manage, Resource
      cannot :destroy, TrackingType, system: true
      can    [:read, :update, :destroy, :recover], Resource, name: Resource::DEFAULT_RESOURCES
    end

  end
end