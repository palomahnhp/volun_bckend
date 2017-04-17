module Abilities
  class InternalStaff
    include CanCan::Ability

    def initialize(user)
      cannot :manage, Setting
      cannot :manage, Resource
      cannot :manage, Permission
      cannot :manage, Manager
      cannot :manage, User
      cannot :administration, WelcomeController
      cannot :maintenance, WelcomeController
      cannot :update_checks, Project

      can :pt_extensions_menu, Project
      can :rt_extensions_menu, RequestForm

      # Add and override permissions
      user.loggable.permissions.each do |permission|
        resource_class = permission.resource.class_name
        permission.permitted_actions.each do |permitted_action|
          can permitted_action, resource_class
        end
      end
    end

  end
end