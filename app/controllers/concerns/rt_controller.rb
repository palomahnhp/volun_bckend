module RtController
  extend ActiveSupport::Concern

  included do

    before_action :set_statuses, only: :index

    protected

      def set_statuses
        params[:pending]    ||= 'true'
        params[:processing] ||= 'true'

        statuses.each do |status|
          params[status] = cast_as_boolean params[status]
        end
      end

      def statuses
        @statuses ||= RequestForm.status_names
      end

      def update_request_form_status(status_name, request_form, attributes = {})
        request_form.update_and_trace(status_name, attributes.merge(manager_id: current_user.loggable.id))
      end

  end

end