
class AddNotNullConstraintToColumns < ActiveRecord::Migration

  NOT_NULL_COLUMNS = {
    :users                 => [:notice_type_id],
    :ent_trackings         => [:tracking_type_id, :entity_id, :tracked_at],
    :project_types         => [:kind, :description],
    :projects              => [:name,
                               :description,
                               :execution_start_date,
                               :contact_name,
                               :contact_last_name,
                               :phone_number,
                               :email,
                               :project_type_id,
                               :pt_extendable_id,
                               :pt_extendable_type,
                               :entity_id,
                               :active],
    :req_rejection_types   => [:name, :active],
    :req_statuses          => [:kind, :description],
    :request_types         => [:kind, :description],
    :req_status_traces     => [:req_status_id, :request_form_id, :manager_id],
    :request_forms         => [:req_status_id, :status_date, :rt_extendable_id, :rt_extendable_type],
    :entities              => [:name,
                               :email,
                               :representative_name,
                               :representative_last_name,
                               :contact_name,
                               :contact_last_name,
                               :entity_type_id,
                               :address_id],
    :activities            => [:name, :description, :start_date, :transport],
    :record_histories      => [:user_id, :recordable_id, :recordable_type],
    :events                => [:address_id, :eventable_id, :eventable_type],
    :event_types           => [:kind, :description],
    :unsubscribe_levels    => [:kind, :description],
    :timetables            => [:event_id, :execution_date, :start_hour, :end_hour],
    :volunteers            => [:name, :last_name],
    :volun_availabilities  => [:volunteer_id, :day],
    :volun_known_languages => [:volunteer_id, :language_id, :language_level_id],
    :volun_trackings       => [:volunteer_id, :tracking_type_id, :tracking_date],
    :volun_contacts        => [:volunteer_id,
                               :contact_result_id,
                               :project_id,
                               :manager_id,
                               :contact_date],
    :volun_assessments     => [:volunteer_id, :trait_id, :project_id, :assessment],
    :frontpage_elements    => [:created_by, :created_by, :active, :frontpage_position_id],
    :academic_levels       => [:name, :active, :educational_type],
    :id_number_types       => [:name, :active],
    :nationalities         => [:name, :active],
    :statuses              => [:name, :active],
    :employment_statuses   => [:name, :active],
    :degrees               => [:name, :active],
    :unsubscribe_reasons   => [:name, :active],
    :managers              => [:name, :active],
    :profiles              => [:name, :active],
    :info_sources          => [:name, :active],
    :skills                => [:name, :active],
    :professions           => [:name, :active],
    :languages             => [:name, :active],
    :language_levels       => [:name, :active],
    :tracking_types        => [:name, :active],
    :contact_results       => [:name, :active],
    :traits                => [:name, :active],
    :areas                 => [:name, :active],
    :collectives           => [:name, :active],
    :coordinations         => [:name, :active]
  }

  def up
    NOT_NULL_COLUMNS.each do |table, columns|
      columns.each do |column|
        change_column_null table, column, false
      end
    end
  end

  def down
    NOT_NULL_COLUMNS.each do |table, columns|
      columns.each do |column|
        change_column_null table, column, true
      end
    end
  end
end

