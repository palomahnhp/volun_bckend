MODELS_AND_ATTRS = {

  # --------------------------------------------------------------------------------------------------
  # Tables
  # --------------------------------------------------------------------------------------------------

  'RecordHistory' => 'user:references recordable:references{polymorphic} recordable_changed_at:datetime',
  'Province'      => 'name:string:uniq code:string:uniq',
  'RoadType'      => 'name:string:uniq code:string:uniq',
  'EntityType'    => 'kind:integer:uniq description:text active:boolean',
  'Entity'        => 'name:string:uniq description:text active:boolean entity_type:references',
  'Address'       => 'road_type:references road_name road_number_type road_number grader stairs floor door postal_code town province:references country ndp_code local_code class_name latitude longitude',
  'Area'          => 'name:string:uniq description:text active:boolean',
  'Collective'    => 'name:string:uniq description:text active:boolean',
  'Coordination'  => 'name:string:uniq description:text active:boolean',
  'District'      => 'name:string:uniq code:string:uniq active:boolean',


  # --------------------------------------------------------------------------------------------------
  # Project Tables
  # --------------------------------------------------------------------------------------------------

  'ProjectType' => 'kind:integer:uniq description:text active:boolean',

  # -------------------------------------------------

  'Project' => 'name:string:uniq active:boolean description:text functions execution_start_date:date execution_end_date:date contact_name contact_first_surname contact_second_surname phone_number email comments:text beneficiaries_num:integer volunteers_num:integer insured:boolean volunteers_allowed:boolean public:boolean outstanding:boolean insurance_date:date project_type:references pt_extendable:references{polymorphic} entity:references',

  # 1:N tables for Project
  'Tracking'  => 'comments:text start_date:datetime project:references',
  'Issue'     => 'comments:text start_date:datetime project:references',
  'Document'  => 'name:string:uniq description:text documentum_id:string project:references',

  # -------------------------------------------------

  'Event'     => 'eventable:references{polymorphic} address:references',
  'Timetable' => 'event:references execution_date:date start_hour end_hour',

  # 1:N tables

  'Activity' => 'name:string:uniq description:text start_date:datetime end_date:datetime transport:text pdf_url entity:references area:references project:references share:boolean ',
  'Link'     => 'url description:text kind:integer:uniq linkable:references{polymorphic}',

  'Proposal' => 'name:string:uniq description:text active:boolean',

  # -------------------------------------------------

  'Pt::Subvention' => 'representative_name representative_first_surname representative_second_surname id_num vat_num entity_registry:boolean cost:float requested_amount:float subsidized_amount:float initial_volunteers_num:integer participants_num:integer has_quality_evaluation:boolean proposal:references',

  # -------------------------------------------------

  'Pt::Entity' => 'request_date:date request_description:text volunteers_profile activities:text sav_date:date derived_volunteers_num:integer added_volunteers_num:integer agreement_signed:boolean agreement_date:date prevailing:boolean',

  # -------------------------------------------------

  # TODO Add missing tables
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

  'Technician' => 'name profile_id:integer active:boolean',

  'Profile' => 'name:string:uniq active:boolean',

  'Knowledge' => 'name:string:uniq active:boolean',

  'Skill' => 'name:string:uniq active:boolean',

  'Profession' => 'name:string:uniq active:boolean',

  'Language' => 'name:string:uniq active:boolean',

  'LanguageLevel' => 'name:string:uniq active:boolean',

  'TrackingType' => 'name:string:uniq active:boolean',

  'ContactResult' => 'name:string:uniq active:boolean',

  'Trait' => 'name:string:uniq active:boolean',


  'Volunteer' => 'name:string first_surname second_surname document:references id_number gender:integer birth_date:date nationality:references mobile_number phone_number email address:references status:references employment_status:references vocne:boolean available:boolean availability_date:date academic_level:references subscribe_date:date unsubscribe_date:date unsubscribe_reason:references comments:text expectations:text agreement:boolean agreement_date:boolean search_authorization:boolean representative_statement:boolean has_driving_license:boolean technician:references knowledge:references other_academic_info:text skill:references profession:references',


  # 1:N
  'Volun::Availability' => 'volunteer:references day:string start_hour:string end_hour:string',

  # 1:N
  'Volun::Tracking'      => 'volunteer:references tracking_type:references project:references technician:references tracking_date:datetime comments:text',
  'Volun::Contact'       => 'volunteer:references contact_result:references project:references technician:references contact_date:datetime  comments:text',
  'Volun::Assessment'    => 'volunteer:references trait:references project:references trait_other:string assessment:boolean comments:text',

  # --------------------------------------------------------------------------------------------------
  # Request Form Tables
  # --------------------------------------------------------------------------------------------------

  'RejectionType' => 'kind:integer:uniq description:text active:boolean',

  'RequestType'               => 'kind:integer:uniq description:text active:boolean',
  'RequestReason'             => 'kind:integer:uniq description:text active:boolean',
  'RequestForm'               => 'request_type:references rt_extendable:references{polymorphic} user:references sent_at:datetime status:integer status_date:datetime rejection_type:references comments:text',
  'Rt::VolunteerSubscribe'    => 'name:string first_surname second_surname phone_number phone_number_alt email',
  'Rt::VolunteerUnsubscribe'  => 'level:integer reason:text',
  'Rt::VolunteerAmendment'    => 'address:references phone_number phone_number_alt',
  'Rt::VolunteerAppointment'  => 'reason:text',
  'Rt::EntitySubscribe'       => 'name:string:uniq vat_num email contact_name contact_first_surname contact_second_surname representative_name representative_first_surname representative_second_surname phone_number phone_number_alt road_type road_name number_type road_number postal_code town province request_reason:references',
  'Rt::EntityUnsubscribe'     => 'reason:text',
  'Rt::VolunteersDemand'      => 'description:text execution_start_date:date execution_end_date:date road_type road_name number_type road_number postal_code town province requested_volunteers_num volunteers_profile:text volunteer_functions_1:text volunteer_functions_2:text volunteer_functions_3:text',
  'Rt::ProjectPublishing'     => 'description:text road_type road_name number_type road_number postal_code town province',
  'Rt::ProjectUnpublishing'   => 'reason:text',
  'Rt::ProjectUnsubscribe'    => 'project:references reason:text',
  'Rt::ActivityPublishing'    => 'name:string:uniq organizer description:text execution_date:date execution_hour road_type road_name number_type road_number postal_code town province',
  'Rt::ActivityUnpublishing'  => 'reason:text',
  'Rt::Other'                 => 'description:text',


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
    %w(district     project),
    %w(coordination project),

    %w(address volunteer),
    %w(degree  volunteer),
    %w(area    volunteer),
    %w(project volunteer),
]

MANUAL_MIGRATIONS = {
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
          default_value = /(active|volunteers_allowed).*/ === line.chomp
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

  desc 'Builds manual migrations'
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

  desc 'Builds the user model'
  task create_user: :environment do
    # Generate scaffold for User model
    sh 'bundle exec rails generate scaffold User locale profileable:references{polymorphic}'

    # Add devise attrs to User model
    sh 'bundle exec rails generate devise User --skip'
  end

  desc 'Destroy the user model'
  task destroy_user: :environment do
    Rake::Task['scaffold:destroy_devise_routes'].invoke

    # Destroy scaffold for user
    sh 'bundle exec rails destroy scaffold User --skip'

    # Destroy devise scaffold for user
    sh 'rm -f db/migrate/*_devise_*.rb'
  end

  desc 'Builds the application data model basement by scaffolding the models'
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

  desc 'Builds the application data model basement by scaffolding the models'
  task gco_files: :environment do
    sh 'git checkout -- app'
  end

  desc 'Builds the application data model basement by scaffolding the models'
  task destroy_all: :environment do
    puts "Destroying scaffolds"
    Rake::Task['scaffold:destroy'].invoke
    Rake::Task['scaffold:destroy_user'].invoke
  end

  desc 'Builds the application data model basement by scaffolding the models'
  task generate_all: :environment do
    puts "Generating scaffolds"
    Rake::Task['scaffold:create_user'].invoke
    Rake::Task['scaffold:build'].invoke
    Rake::Task['scaffold:build_manual_migrations'].invoke
    Rake::Task['scaffold:add_default_true'].invoke
    Rake::Task['scaffold:gco_files'].invoke
  end

  desc 'Builds the application data model basement by scaffolding the models'
  task recreate_db: :environment do
    puts "Recreating DB and seeding"
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:dev_seed'].invoke
  end

  desc 'Builds/Rebuilds the application data base by scaffolding the models'
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


