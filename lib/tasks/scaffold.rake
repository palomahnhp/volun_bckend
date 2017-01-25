MODELS_AND_ATTRS = {

  # --------------------------------------------------------------------------------------------------
  # Tables
  # --------------------------------------------------------------------------------------------------

  'Area'          => 'name:string:uniq description:text active:boolean',
  'Collective'    => 'name:string:uniq description:text active:boolean',
  'Coordination'  => 'name:string:uniq description:text active:boolean',
  'RecordHistory' => 'user:references recordable:references{polymorphic} recordable_changed_at:datetime',

  'Province'      => 'name:string:uniq code:string:uniq',
  'District'      => 'name:string:uniq code:string:uniq active:boolean',
  'RoadType'      => 'name:string:uniq code:string:uniq',
  'Address'       => 'road_type:references road_name road_number_type road_number grader stairs floor door postal_code borough district:references town province:references country ndp_code local_code class_name latitude longitude',

  'Manager'       => 'name profile_id:integer phone_number active:boolean',
  'TrackingType'  => 'name:string:uniq active:boolean',
  'RequestReason' => 'kind:integer:uniq description:text active:boolean',

  'EntityType'     => 'kind:integer:uniq description:text active:boolean',
  'Entity'         => 'name:string:uniq description:text vat_number email representative_name representative_last_name representative_last_name_alt contact_name contact_last_name contact_last_name_alt phone_number phone_number_alt publish_pictures:boolean annual_survey:boolean request_reason:references entity_type:references comments:text other_subscribe_reason:text address:references active:boolean subscribed_at:datetime unsubscribed_at:datetime',
  'Ent::Tracking'  => 'tracking_type:references entity:references manager:references tracked_at:datetime comments:text',



  # --------------------------------------------------------------------------------------------------
  # Project Tables
  # --------------------------------------------------------------------------------------------------

  'ProjectType' => 'kind:integer:uniq description:text active:boolean',

  # -------------------------------------------------

  'Project' => 'name:string:uniq active:boolean description:text functions execution_start_date:date execution_end_date:date contact_name contact_last_name contact_last_name_alt phone_number phone_number_alt email comments:text beneficiaries_num:integer volunteers_num:integer insured:boolean volunteers_allowed:boolean publish:boolean outstanding:boolean insurance_date:date project_type:references pt_extendable:references{polymorphic} entity:references',

  # 1:N tables for Project
  'Pro::Tracking'  => 'comments:text start_date:datetime project:references',
  'Pro::Issue'     => 'comments:text start_date:datetime project:references',

  'Document'      => 'name:string:uniq description:text documentum_id:string project:references',

  # -------------------------------------------------

  'EventType' => 'kind:integer:uniq description:text',
  'Event'     => 'publish:boolean eventable:references{polymorphic} event_type:references address:references',
  'Timetable' => 'event:references execution_date:date start_hour end_hour',

  # 1:N tables

  'Activity' => 'name:string:uniq description:text start_date:datetime end_date:datetime transport:text pdf_url entity:references area:references project:references share:boolean ',
  'Link'     => 'url description:text kind:integer linkable:references{polymorphic}',

  'Proposal' => 'name:string:uniq description:text active:boolean',

  # -------------------------------------------------

  'Pt::Subvention' => 'representative_name representative_last_name representative_last_name_alt id_num vat_number entity_registry:boolean cost:float requested_amount:float subsidized_amount:float initial_volunteers_num:integer participants_num:integer has_quality_evaluation:boolean proposal:references',

  # -------------------------------------------------

  'Pt::Entity' => 'request_date:date request_description:text volunteers_profile activities:text sav_date:date derived_volunteers_num:integer added_volunteers_num:integer agreement_signed:boolean agreement_date:date prevailing:boolean',

  # -------------------------------------------------

  # --------------------------------------------------------------------------------------------------
  # Volunteer Tables
  # --------------------------------------------------------------------------------------------------

  'IdNumberType' => 'name:string:uniq active:boolean',

  'Nationality' => 'name:string:uniq active:boolean',

  'Status' => 'name:string:uniq active:boolean',

  'EmploymentStatus' => 'name:string:uniq active:boolean',

  'Degree' => 'name:string:uniq active:boolean',

  'AcademicLevel' => 'name:string:uniq educational_type active:boolean',

  'UnsubscribeReason' => 'name:string:uniq active:boolean',

  'Profile' => 'name:string:uniq active:boolean',

  'InfoSource' => 'name:string:uniq active:boolean',

  'Skill' => 'name:string:uniq active:boolean',

  'Profession' => 'name:string:uniq active:boolean',

  'Language' => 'name:string:uniq active:boolean',

  'LanguageLevel' => 'name:string:uniq active:boolean',

  'ContactResult' => 'name:string:uniq active:boolean',

  'Trait' => 'name:string:uniq active:boolean',

  'Borough'     => 'name active district:references',

  'ContactType' => 'name active',

  'DegreeType'  => 'name educational_type',

  'Motivation'  => 'name active',

  'Sector'      => 'name active',

  'Volunteer' => 'name:string last_name last_name_alt id_number_type:references id_number gender:integer birth_date:date nationality:references phone_number phone_number_alt email address:references status:references employment_status:references vocne:boolean available:boolean availability_date:date academic_level:references subscribe_date:date unsubscribe_date:date unsubscribe_reason:references comments:text expectations:text agreement:boolean agreement_date:datetime search_authorization:boolean representative_statement:boolean has_driving_license:boolean publish_pictures:boolean annual_survey:boolean subscribed_at:datetime manager:references info_source:references other_academic_info:text profession:references active:boolean',


  # 1:N
  'Volun::Availability' => 'volunteer:references day:string start_hour:string end_hour:string',

  # N:N
  'Volun::Tracking'      => 'volunteer:references tracking_type:references project:references manager:references tracking_date:datetime comments:text',
  'Volun::Contact'       => 'volunteer:references contact_result:references project:references manager:references contact_type:references contact_date:datetime  comments:text',
  'Volun::Assessment'    => 'volunteer:references trait:references project:references trait_other:string assessment:boolean comments:text',

  # --------------------------------------------------------------------------------------------------
  # Request Form Tables
  # --------------------------------------------------------------------------------------------------

  'RejectionType' => 'kind:integer:uniq description:text active:boolean',

  'RequestType'               => 'kind:integer:uniq description:text active:boolean',
  'RequestForm'               => 'request_type:references rt_extendable:references{polymorphic} user:references status:integer status_date:datetime rejection_type:references request_reason:references comments:text',
  'Rt::VolunteerSubscribe'    => 'name last_name last_name_alt id_number_type:references id_number gender:integer birth_date:date nationality:references phone_number phone_number_alt email road_type:references road_name number_type road_number postal_code borough district:references town province:references status:references employment_status:references vocne:boolean available:boolean availability_date:date academic_level:references comments:text expectations:text agreement:boolean agreement_date:datetime search_authorization:boolean representative_statement:boolean has_driving_license:boolean publish_pictures:boolean annual_survey:boolean info_source:references other_academic_info:text profession:references',
  'Rt::VolunteerUnsubscribe'  => 'level:integer reason:text',
  'Rt::VolunteerAmendment'    => 'road_type:references road_name number_type road_number postal_code borough district:references town province:references phone_number phone_number_alt email',
  'Rt::VolunteerAppointment'  => 'reason:text',
  'Rt::EntitySubscribe'       => 'name description:text vat_number email representative_name representative_last_name representative_last_name_alt contact_name contact_last_name contact_last_name_alt phone_number phone_number_alt publish_pictures:boolean annual_survey:boolean entity_type:references comments:text other_subscribe_reason:text road_type:references road_name number_type road_number postal_code borough district:references town province:references',
  'Rt::EntityUnsubscribe'     => 'reason:text',
  'Rt::VolunteersDemand'      => 'description:text execution_start_date:date execution_end_date:date road_type:references road_name number_type road_number postal_code borough district:references town province:references requested_volunteers_num volunteers_profile:text volunteer_functions_1:text volunteer_functions_2:text volunteer_functions_3:text',
  'Rt::ProjectPublishing'     => 'description:text road_type:references road_name number_type road_number postal_code borough district:references town province:references',
  'Rt::ProjectUnpublishing'   => 'reason:text',
  'Rt::ProjectUnsubscribe'    => 'project:references reason:text',
  'Rt::ActivityPublishing'    => 'name organizer description:text execution_date:date execution_hour road_type:references road_name number_type road_number postal_code borough district:references town province:references project:references',
  'Rt::ActivityUnpublishing'  => 'reason:text',
  'Rt::Other'                 => 'description:text',


  ## TODO Would not the following Rt's be necessary for consistency?
  ## 'Rt::ProjectSubscribe'     => 'name:string:uniq description:text active:boolean',
  ## 'Rt::ActivitySubscribe'    => 'name:string:uniq description:text active:boolean',
  ## 'Rt::ProjectUnsubscribe'   => 'name:string:uniq description:text active:boolean',
  ## 'Rt::ActivityUnsubscribe'  => 'name:string:uniq description:text active:boolean',

  # -------------------------------------------------

}

# N:N (advanced)
ADVANCED_JOINED_TABLES = {
  'Volun::KnownLanguage' => 'volunteer:references language:references language_level:references',
}

# N:N (simple)
JOINED_TABLES = [
  %w(area         project),
  %w(collective   project),
  %w(coordination project),
  %w(entity       project),

  %w(address volunteer),
  %w(area    volunteer),
  %w(degree  volunteer),
  %w(project volunteer),
  %w(skill   volunteer),
]

MANUAL_MIGRATIONS = {
  :add_not_null_constraint_to_columns => %q(
class AddNotNullConstraintToColumns < ActiveRecord::Migration

  NOT_NULL_COLUMNS = {
    :users                 => [:notice_type_id],
    :ent_trackings         => [:tracking_type_id, :entity_id, :tracked_at],
    :project_types         => [:kind, :description, :active],
    :projects              => [:name,
                               :description,
                               :execution_start_date,
                               :contact_name,
                               :contact_last_name,
                               :phone_number,
                               :email,
                               :project_type_id,
                               :entity_id,
                               :active],
    :entities              => [:name,
                               :email,
                               :representative_name,
                               :representative_last_name,
                               :contact_name,
                               :contact_last_name,
                               :entity_type_id,
                               :address_id],
    :activities            => [:name, :description, :start_date, :transport],
    :record_histories      => [:user_id, :recordable_id, :recordable_type, :recordable_changed_at],
    :events                => [:address_id, :eventable_id, :eventable_type],
    :event_types           => [:kind],
    :timetables            => [:event_id, :execution_date, :start_hour, :end_hour],
    :volunteers            => [:name, :last_name, :address_id],
    :volun_availabilities  => [:volunteer_id, :day],
    :volun_known_languages => [:volunteer_id, :language_id, :language_level_id],
    :volun_trackings       => [:volunteer_id, :tracking_type_id, :tracking_date],
    :volun_contacts        => [:volunteer_id,
                               :contact_result_id,
                               :project_id,
                               :manager_id,
                               :contact_date],
    :volun_assessments     => [:volunteer_id, :trait_id, :project_id, :assessment],
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
    :coordinations         => [:name, :active],
    :rejection_types       => [:kind, :active]
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
),
  # Projects and ProjectTypes
  :add_kind_constraint_to_project_types => %q(
class AddKindConstraintToProjectTypes < ActiveRecord::Migration
  def up
    execute %{
      ALTER TABLE
        project_types
      ADD CONSTRAINT
        kind_and_id_must_be_equal
        CHECK (
          (id = #{ProjectType.kinds[:pt_social]}     AND kind = #{ProjectType.kinds[:pt_social]})     OR
          (id = #{ProjectType.kinds[:pt_centre]}     AND kind = #{ProjectType.kinds[:pt_centre]})     OR
          (id = #{ProjectType.kinds[:pt_permanent]}  AND kind = #{ProjectType.kinds[:pt_permanent]})  OR
          (id = #{ProjectType.kinds[:pt_punctual]}   AND kind = #{ProjectType.kinds[:pt_punctual]})   OR
          (id = #{ProjectType.kinds[:pt_entity]}     AND kind = #{ProjectType.kinds[:pt_entity]})     OR
          (id = #{ProjectType.kinds[:pt_subvention]} AND kind = #{ProjectType.kinds[:pt_subvention]}) OR
          (id = #{ProjectType.kinds[:pt_other]}      AND kind = #{ProjectType.kinds[:pt_other]})
        )
    }
  end

  def down
    execute %{
      ALTER TABLE
        project_types
      DROP CONSTRAINT
        kind_and_id_must_be_equal
    }
  end
end
),
  :add_pt_extendable_constraint_to_projects => %q(
class AddPtExtendableConstraintToProjects < ActiveRecord::Migration
  def up
    execute %{
      ALTER TABLE
        projects
      ADD CONSTRAINT
        pt_extendable_must_be_consistent
        CHECK (
          (project_type_id = #{ProjectType.kinds[:pt_social]}     AND pt_extendable_type IS NULL) OR
          (project_type_id = #{ProjectType.kinds[:pt_centre]}     AND pt_extendable_type IS NULL) OR
          (project_type_id = #{ProjectType.kinds[:pt_permanent]}  AND pt_extendable_type IS NULL) OR
          (project_type_id = #{ProjectType.kinds[:pt_punctual]}   AND pt_extendable_type IS NULL) OR
          (project_type_id = #{ProjectType.kinds[:pt_entity]}     AND pt_extendable_type = '#{Pt::Entity.name}') OR
          (project_type_id = #{ProjectType.kinds[:pt_subvention]} AND pt_extendable_type = '#{Pt::Subvention.name}') OR
          (project_type_id = #{ProjectType.kinds[:pt_other]}      AND pt_extendable_type IS NULL)
        )
    }
  end

  def down
    execute %{
      ALTER TABLE
        projects
      DROP CONSTRAINT
        pt_extendable_must_be_consistent
    }
  end
end
),
  :add_kind_constraint_to_request_types => %q(
class AddKindConstraintToRequestTypes < ActiveRecord::Migration
  def up
    execute %{
      ALTER TABLE
        request_types
      ADD CONSTRAINT
        kind_and_id_must_be_equal
        CHECK (
          (id = #{RequestType.kinds[:rt_volunteer_subscribe]}   AND kind = #{RequestType.kinds[:rt_volunteer_subscribe]})   OR
          (id = #{RequestType.kinds[:rt_volunteer_unsubscribe]} AND kind = #{RequestType.kinds[:rt_volunteer_unsubscribe]}) OR
          (id = #{RequestType.kinds[:rt_volunteer_amendment]}   AND kind = #{RequestType.kinds[:rt_volunteer_amendment]})   OR
          (id = #{RequestType.kinds[:rt_volunteer_appointment]} AND kind = #{RequestType.kinds[:rt_volunteer_appointment]}) OR
          (id = #{RequestType.kinds[:rt_entity_subscribe]}      AND kind = #{RequestType.kinds[:rt_entity_subscribe]})      OR
          (id = #{RequestType.kinds[:rt_entity_unsubscribe]}    AND kind = #{RequestType.kinds[:rt_entity_unsubscribe]})    OR
          (id = #{RequestType.kinds[:rt_volunteers_demand]}     AND kind = #{RequestType.kinds[:rt_volunteers_demand]})     OR
          (id = #{RequestType.kinds[:rt_project_publishing]}    AND kind = #{RequestType.kinds[:rt_project_publishing]})    OR
          (id = #{RequestType.kinds[:rt_project_unpublishing]}  AND kind = #{RequestType.kinds[:rt_project_unpublishing]})  OR
          (id = #{RequestType.kinds[:rt_project_unsubscribe]}   AND kind = #{RequestType.kinds[:rt_project_unsubscribe]})   OR
          (id = #{RequestType.kinds[:rt_activity_publishing]}   AND kind = #{RequestType.kinds[:rt_activity_publishing]})   OR
          (id = #{RequestType.kinds[:rt_activity_unpublishing]} AND kind = #{RequestType.kinds[:rt_activity_unpublishing]}) OR
          (id = #{RequestType.kinds[:rt_other]}                 AND kind = #{RequestType.kinds[:rt_other]})
        )
    }
  end

  def down
    execute %{
      ALTER TABLE
        request_types
      DROP CONSTRAINT
        kind_and_id_must_be_equal
    }
  end
end
),
  :add_rt_extendable_constraint_to_request_forms => %q(
class AddRtExtendableConstraintToRequestForms < ActiveRecord::Migration
  def up
    execute %{
      ALTER TABLE
        request_forms
      ADD CONSTRAINT
        rt_extendable_must_be_consistent
        CHECK (
          (request_type_id = #{RequestType.kinds[:rt_volunteer_subscribe]}   AND rt_extendable_type = '#{Rt::VolunteerSubscribe.name}')   OR
          (request_type_id = #{RequestType.kinds[:rt_volunteer_unsubscribe]} AND rt_extendable_type = '#{Rt::VolunteerUnsubscribe.name}') OR
          (request_type_id = #{RequestType.kinds[:rt_volunteer_amendment]}   AND rt_extendable_type = '#{Rt::VolunteerAmendment.name}')   OR
          (request_type_id = #{RequestType.kinds[:rt_volunteer_appointment]} AND rt_extendable_type = '#{Rt::VolunteerAppointment.name}') OR
          (request_type_id = #{RequestType.kinds[:rt_entity_subscribe]}      AND rt_extendable_type = '#{Rt::EntitySubscribe.name}')      OR
          (request_type_id = #{RequestType.kinds[:rt_entity_unsubscribe]}    AND rt_extendable_type = '#{Rt::EntityUnsubscribe.name}')    OR
          (request_type_id = #{RequestType.kinds[:rt_volunteers_demand]}     AND rt_extendable_type = '#{Rt::VolunteersDemand.name}')     OR
          (request_type_id = #{RequestType.kinds[:rt_project_publishing]}    AND rt_extendable_type = '#{Rt::ProjectPublishing.name}')    OR
          (request_type_id = #{RequestType.kinds[:rt_project_unpublishing]}  AND rt_extendable_type = '#{Rt::ProjectUnpublishing.name}')  OR
          (request_type_id = #{RequestType.kinds[:rt_project_unsubscribe]}   AND rt_extendable_type = '#{Rt::ProjectUnsubscribe.name}')   OR
          (request_type_id = #{RequestType.kinds[:rt_activity_publishing]}   AND rt_extendable_type = '#{Rt::ActivityPublishing.name}')   OR
          (request_type_id = #{RequestType.kinds[:rt_activity_unpublishing]} AND rt_extendable_type = '#{Rt::ActivityUnpublishing.name}') OR
          (request_type_id = #{RequestType.kinds[:rt_other]}                 AND rt_extendable_type = '#{Rt::Other.name}')
        )
    }
  end

  def down
    execute %{
      ALTER TABLE
        request_forms
      DROP CONSTRAINT
        rt_extendable_must_be_consistent
    }
  end
end
),

  # Events and EventTypes

  :add_kind_constraint_to_event_types => %q(
  class AddKindConstraintToEventTypes < ActiveRecord::Migration
    def up
      execute %{
      ALTER TABLE
        event_types
      ADD CONSTRAINT
        kind_and_id_must_be_equal
        CHECK (
          (id = #{EventType.kinds[:activity]} AND kind = #{EventType.kinds[:activity]}) OR
          (id = #{EventType.kinds[:project]}  AND kind = #{EventType.kinds[:project]})
        )
    }
    end

    def down
      execute %{
      ALTER TABLE
        event_types
      DROP CONSTRAINT
        kind_and_id_must_be_equal
    }
    end
  end
),
  :add_eventable_constraint_to_events => %q(
    class AddEventableConstraintToEvents < ActiveRecord::Migration
      def up
        execute %{
      ALTER TABLE
        events
      ADD CONSTRAINT
        eventable_must_be_consistent
        CHECK (
          (event_type_id = #{EventType.kinds[:activity]} AND eventable_type = '#{Activity.name}') OR
          (event_type_id = #{EventType.kinds[:project]}  AND eventable_type = '#{Project.name}')
        )
    }
      end

      def down
        execute %{
      ALTER TABLE
        events
      DROP CONSTRAINT
        eventable_must_be_consistent
    }
      end
    end
)
}


namespace :scaffold do
  desc 'Deletes "devise_for :users" line in routes.rb'
  task destroy_devise_routes: :environment do
    require 'fileutils'
    require 'tempfile'

    # Open temporary file
    tmp = Tempfile.new('extract')

    # Write good lines to temporary file
    File.open('config/routes.rb', 'r').each { |l| tmp << l unless /devise_for/ =~ l.chomp }

    # Close tmp, or troubles ahead
    tmp.close

    # Move temp file to origin
    FileUtils.mv(tmp.path, 'config/routes.rb')
  end

  desc 'Add default: true in migrations with field active'
  task add_default_true: :environment do
    require 'fileutils'
    require 'tempfile'

    Dir.glob('db/migrate/*.rb') do |rb_file|
      tmp = Tempfile.new('extract')

      File.open(rb_file, 'r').each do |l|
        line = l
        if line.chomp =~ /boolean.*/
          default_value = /(active|volunteers_allowed|publish).*/ === line.chomp
          line  = line.sub("\n", '')
          line += ", default: #{default_value}\n"
        end
        tmp  << line
      end

      tmp.close

      # Move temp file to origin
      FileUtils.mv(tmp.path, rb_file)
    end
  end

  desc 'Add null: false to some migrations'
  task add_null_false: :environment do
    require 'fileutils'
    require 'tempfile'

    Dir.glob('db/migrate/*.rb') do |rb_file|
      tmp = Tempfile.new('extract')

      File.open(rb_file, 'r').each do |l|
        line = l
        if line.chomp =~ /references :address.*/
          line  = line.sub("\n", '')
          line += ", null: false\n"
        end
        tmp  << line
      end

      tmp.close

      # Move temp file to origin
      FileUtils.mv(tmp.path, rb_file)
    end
  end

  desc 'Build manual migrations'
  task build_manual_migrations: :environment do
    MANUAL_MIGRATIONS.each do |name, content|
      sh "bundle exec rails generate migration #{name}"
      sh "echo \"#{content}\" > $(ls db/migrate/*#{name}.rb)"
    end
  end

  desc 'Destroy manual migrations'
  task destroy_manual_migrations: :environment do
    MANUAL_MIGRATIONS.keys.each do |name|
      sh "bundle exec rails destroy migration #{name}"
    end
  end

  desc 'Build the user model and their dependant models'
  task create_user: :environment do
    # Generate scaffold for User model
    sh 'bundle exec rails generate scaffold NoticeType kind:integer:uniq description:text active:boolean'
    sh 'bundle exec rails generate scaffold User login locale notice_type:references loggable:references{polymorphic}'

    # Add devise attrs to User model
    sh 'bundle exec rails generate devise User --skip'
  end

  desc 'Destroy the user model'
  task destroy_user: :environment do
    Rake::Task['scaffold:destroy_devise_routes'].invoke

    # Destroy scaffold for user
    sh 'bundle exec rails destroy scaffold User --skip'
    sh 'bundle exec rails destroy scaffold NoticeType'

    # Destroy devise scaffold for user
    sh 'rm -f db/migrate/*_devise_*.rb'
  end

  desc 'Build the application data model basement by scaffolding the models'
  task build: :environment do
    # Generate the scaffolds for all models
    MODELS_AND_ATTRS.each do |model_name, attrs_list|
      sh "bundle exec rails generate scaffold #{model_name} #{attrs_list} -f"
    end

    # Generate the models for advanced join tables
    ADVANCED_JOINED_TABLES.each do |model_name, attrs_list|
      sh "bundle exec rails generate model #{model_name} #{attrs_list} -f"
    end

    # Generate simple intermediate models
    JOINED_TABLES.each do |table1, table2|
      if table1 > table2
        _table1 = table1.dup
        table1  = table2
        table2  = _table1
      end
      sh "bundle exec rails generate migration create_join_table_#{table1}_#{table2} #{table1}:index #{table2}:index -f"
    end
  end

  desc 'Destroy the models and the files generated by the scaffolding'
  task destroy: :environment do
    # Destroy the scaffolds of all models
    MODELS_AND_ATTRS.keys.each do |model_name|
      sh "bundle exec rails destroy scaffold #{model_name}"
    end

    # Destroy models
    ADVANCED_JOINED_TABLES.keys.each do |model_name|
      sh "bundle exec rails destroy model #{model_name}"
    end

    # Generate simple intermediate models
    JOINED_TABLES.each do |table1, table2|
      if table1 > table2
        _table1 = table1.dup
        table1  = table2
        table2  = _table1
      end
      sh "bundle exec rails destroy migration create_join_table_#{table1}_#{table2}"
    end

    Rake::Task['scaffold:destroy_manual_migrations'].invoke
  end

  desc 'Build the application data model basement by scaffolding the models'
  task gco_files: :environment do
    sh 'git checkout -- app'
  end

  desc 'Build the application data model basement by scaffolding the models'
  task destroy_all: :environment do
    puts "Destroying scaffolds"
    Rake::Task['scaffold:destroy'].invoke
    Rake::Task['scaffold:destroy_user'].invoke
  end

  desc 'Build the application data model basement by scaffolding the models'
  task generate_all: :environment do
    puts "Generating scaffolds"
    Rake::Task['scaffold:create_user'].invoke
    Rake::Task['scaffold:build'].invoke
    Rake::Task['scaffold:build_manual_migrations'].invoke
    Rake::Task['scaffold:add_default_true'].invoke
    Rake::Task['scaffold:add_null_false'].invoke
    Rake::Task['scaffold:gco_files'].invoke
  end

  desc 'Build the application data model basement by scaffolding the models'
  task recreate_db: :environment do
    puts "Recreating DB and seeding"
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:dev_seed'].invoke
  end

  desc 'Build/Rebuilds the application data base by scaffolding the models'
  task reset: :environment do
    puts "You are going to drop/create the whole DB. Proceed? (y/n) "
    continue = STDIN.gets.chomp.to_s
    unless continue =~ /\A(n|no)\z/i
      puts "Destroying scaffolds"
      Rake::Task['scaffold:destroy_all'].invoke

      puts "Generating scaffolds"
      Rake::Task['scaffold:generate_all'].invoke

      puts "Recreating DB and seeding"
      Rake::Task['scaffold:recreate_db'].invoke
    end
  end
end


