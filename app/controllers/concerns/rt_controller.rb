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

  end

  class RejectionManager

    attr_accessor :rejection_type, :request_form

    def initialize(request_form_params = {})
      @req_rejection_type_id = request_form_params[:req_rejection_type_id]
      @request_form_id       = request_form_params[:id]
    end

    def rejection_type
      @rejection_type ||= Req::RejectionType.find_by(id: @req_rejection_type_id.to_i)
    end

    def request_form
      @request_form ||= RequestForm.find_by(id: @request_form_id.to_i)
    end

    def reject_request_form(options = {})
      request_form.status = Req::Status.public_send(:rejected).take
      request_form.rejection_type = rejection_type
      if request_form.valid?
        request_form.update_and_trace_status!(:rejected,
                                              manager_id: options[:manager_id],
                                              req_rejection_type_id: rejection_type.id)
      end
    end

  end

end