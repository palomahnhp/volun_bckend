module Recordable
  extend ActiveSupport::Concern

  included do
    has_many :record_histories, as: :recordable

    def update_history(session_user_id)
      return unless session_user_id
      record_history = RecordHistory.where(recordable_id: id, recordable_type: self.class.name)
                                    .first_or_initialize
      record_history.recordable_changed_at = updated_at unless record_history.new_record?
      record_history.user_id = session_user_id
      record_history.save! if record_history.recordable_changed_at != updated_at
    end
  end
end