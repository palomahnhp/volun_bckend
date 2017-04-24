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

      can :recover, :all
      can :bdc_search_towns, Address
      can :bdc_search_roads, Address
      can :bdc_search_road_numbers, Address
      can :pt_extensions_menu, Project
      can :rt_extensions_menu, RequestForm
      can [:process_request_form, :pre_approve_request_form, :pre_reject_request_form, :reject_request_form],
          Rt::VolunteerSubscribe
      can [:process_request_form, :approve_and_render_unsubscribes_path, :pre_approve_request_form,
           :pre_reject_request_form, :reject_request_form, :mark_request_form_as_pending],
          Rt::VolunteerUnsubscribe
      can [:process_request_form, :pre_approve_request_form, :pre_reject_request_form, :reject_request_form,
           :mark_request_form_as_pending],
          Rt::Other

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
