MODELS_AND_ATTRS = {

  # -------------------------------------------------
  # 1:N tables
  # -------------------------------------------------

  'Proposal' => 'name description:text',
  'Entity'   => 'name description:text active:boolean',

  # -------------------------------------------------

  'ProjectType' => 'name description:text active:boolean',

  # -------------------------------------------------

  'Project' => 'name active:boolean description:text functions execution_start_date:date execution_end_date:date contact_person phone_number email comments:text beneficiaries_num:integer volunteers_num:integer insured:boolean insurance_date project_type:references entity:references',

  # -------------------------------------------------

  'Tracking'  => 'name description:text project:references',
  'Issue'     => 'name description:text project:references',
  'Timetable' => 'day:integer start_hour end_hour:date project:references',
  'Document'  => 'name description documentum_id:string project:references',

  # -------------------------------------------------

  'ProjectTypeSubsidized' => 'legal_representative entity_registry:boolean cost:float requested_amount:float subsidized_amount:float initial_volunteers_num:integer participants_num:integer has_quality_evaluation:boolean proposal:references project:references project_type:references',

  # -------------------------------------------------

  'ProjectTypeEntity' => 'request_date:date request_description:text requested_volunteers_num:integer volunteers_profile activities:text sav_date:date derived_volunteers_num:integer added_volunteers_num:integer agreement_signed:boolean agreement_date:date prevailing:boolean project:references project_type:references',

  # -------------------------------------------------

  'ProjectTypeExceptional' => 'project:references project_type:references',

  # -------------------------------------------------

  'ProjectTypePermanent' => 'project:references project_type:references',

  # -------------------------------------------------

  'ProjectTypeCentre' => 'project:references project_type:references',

  # -------------------------------------------------

  'ProjectTypeSocial' => 'project:references project_type:references',

  # -------------------------------------------------

  'ProjectTypeOther' => 'project:references project_type:references',

  # -------------------------------------------------


  # -------------------------------------------------
  # N:N tables
  # -------------------------------------------------

  'Address'      => 'postal_code road_type road_name number_type number grader stairs_number floor_number door_number',
  'Area'         => 'name description:text active:boolean',
  'Collective'   => 'name description:text active:boolean',
  'Coordination' => 'name description:text active:boolean',
  'District'     => 'name',

  # -------------------------------------------------

  'RecordHistory' => 'user:references recordable_id:integer recordable_type recordable_changed_at:date',

}

# AUX_MODELS_AND_ATTRS = {}

JOINED_TABLES = [
    %w(project address),
    %w(project area),
    %w(project collective),
    %w(project district),
]


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
          default_value = /active.*/ === line.chomp
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

  desc 'Builds the user model'
  task create_user: :environment do
    # Add devise attrs to User model
    sh 'rails generate devise User --skip'
  end

  desc 'Destroy the user model'
  task destroy_user: :environment do
    Rake::Task['scaffold:destroy_devise_routes'].invoke

    # Generate scaffold for user
    sh 'rails destroy scaffold User --skip'
  end

  desc 'Builds the application data model basement by scaffolding the models'
  task build: :environment do
    # Generate the scaffolds for all models
    MODELS_AND_ATTRS.each do |model_name, attrs_list|
      sh "rails generate scaffold #{model_name} #{attrs_list} --skip"
    end

    # # Generate intermediate models
    # AUX_MODELS_AND_ATTRS.each do |model_name, attrs_list|
    #   sh "rails generate model #{model_name} #{attrs_list} --skip"
    # end

    # Generate simple intermediate models
    JOINED_TABLES.each do |table1, table2|
      sh "rails g migration create_join_table_#{table1}_#{table2} #{table1}:index #{table2}:index"
    end
  end

  desc 'Destroy the models and the files generated by the scaffolding'
  task destroy: :environment do
    # Destroy the scaffolds of all models
    MODELS_AND_ATTRS.keys.each do |model_name|
      sh "rails destroy scaffold #{model_name}"
    end

    # # Destroy models
    # AUX_MODELS_AND_ATTRS.keys.each do |model_name|
    #   sh "rails destroy model #{model_name}"
    # end

    # Generate simple intermediate models
    JOINED_TABLES.each do |table1, table2|
      if table1 > table2
        _table1 = table1.dup
        table1  = table2
        table2  = _table1
      end
      sh "rails destroy migration rails g migration create_join_table_#{table1}_#{table2}"
    end
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

  desc 'Builds the application data model basement by scaffolding the models'
  task reset: :environment do
    puts "Destroying scaffolds"
    Rake::Task['scaffold:destroy_all'].invoke

    puts "Generating scaffolds"
    Rake::Task['scaffold:generate_all'].invoke

    puts "Recreating DB and seeding"
    Rake::Task['scaffold:recreate_db'].invoke
  end
end


