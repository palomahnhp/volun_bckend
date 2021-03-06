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
      @request_form_comments = options[:comments]
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
      update_and_trace_status(:rejected, manager_id: @manager_id, req_rejection_type_id: rejection_type.try(:id), comments: @request_form_comments)
    end

    def process_request_form
      return if recently_processed_by_different_manager?

      update_and_trace_status(:processing, manager_id: @manager_id)
    end

    def recently_processed_by_different_manager?
      if request_form.processing? && recently_processed? && different_manager?
        self.errors << I18n.t('messages.another_manager_is_processing_this_request_form', manager: request_form.manager)
      end
    end

    def different_manager?
      request_form.manager.id != @manager_id
    end

    def recently_processed?
      ((Time.now - request_form.status_date.to_time) / 1.hour).hours < 3.hours
    end

    def mark_request_form_as_pending
      update_and_trace_status(:pending, manager_id: @manager_id, req_rejection_type_id: nil)
    end

    def update_and_trace_status(status_name, options = {})
      unless request_form.update_and_trace_status(status_name, options)
        self.errors += request_form.errors.full_messages
      end
      errors.blank?
    end

    def show_errors
      "#{I18n.t('messages.errors_found_in_request_form')}\n #{errors.to_sentence}"
    end

  end

end