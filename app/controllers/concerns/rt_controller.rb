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

  class StatusManager

    attr_accessor :errors, :rejection_type, :request_form

    def initialize(options = {})
      @req_rejection_type_id = options[:req_rejection_type_id]
      @request_form_id       = options[:id]
      @request_form          = options[:request_form]
      @manager_id            = options[:manager_id]
      @errors                = []
    end

    def rejection_type
      @rejection_type ||= Req::RejectionType.find_by(id: @req_rejection_type_id.to_i)
    end

    def request_form
      @request_form ||= RequestForm.find_by(id: @request_form_id.to_i)
    end

    def reject_request_form
      request_form.status = Req::Status.public_send(:rejected).take
      request_form.rejection_type = rejection_type
      if request_form.valid?
        request_form.update_and_trace_status!(:rejected,
                                              manager_id: @manager_id,
                                              req_rejection_type_id: rejection_type.id)
      else
        self.errors += request_form.errors.full_messages
        nil
      end
    end

    def process_request_form
      request_form.status = Req::Status.public_send(:processing).take
      if request_form.valid?
        request_form.update_and_trace_status!(:processing, manager_id: @manager_id)
      else
        self.errors += request_form.errors.full_messages
        nil
      end
    end

    def mark_request_form_as_pending
      request_form.status = Req::Status.public_send(:pending).take
      request_form.rejection_type = nil
      if request_form.valid?
        request_form.update_and_trace_status!(:pending, manager_id: @manager_id, req_rejection_type_id: nil)
      else
        self.errors += request_form.errors.full_messages
        nil
      end
    end

    def show_errors
      "#{I18n.t('messages.errors_found_in_request_form')}\n #{errors.to_sentence}"
    end

  end

end