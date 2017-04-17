class Permission < ActiveRecord::Base

  belongs_to :manager
  belongs_to :resource


  def permitted_actions
    [:create, :read, :update, :destroy].select{ |action| public_send "can_#{action}"}
  end

end
