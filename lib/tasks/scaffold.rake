MODELS_AND_ATTRS = {
  'Proposal'    => 'name comments:text registry_date:date approval_date:date',
  'ProjectType' => 'name status:integer',
  'District'    => 'name',
  'Scope'       => 'name status:integer',
  'Project'     => 'code name description ' \
                          'registry_date:date start_date:date end_date:date city_hall ' \
                          'important status assessment work_place manager manager_telf ' \
                          'voluntaries_num:integer profile cooperation_agreement ' \
                          'district:references proposal:references project_type:references',
  'Activity'    => 'project:references description:text hour'
}
AUX_MODELS_AND_ATTRS = {
  'ProjectScope' => 'project:references scope:references'
}


namespace :scaffold do
  desc 'Deletes "devise_for :users" line in routes.rb'
  task destroy_devise_routes: :environment do
    require 'fileutils'
    require 'tempfile'

    # Open temporary file
    tmp = Tempfile.new('extract')

    # Write good lines to temporary file
    open('config/routes.rb', 'r').each { |l| tmp << l unless /devise_for/ =~ l.chomp }

    # Close tmp, or troubles ahead
    tmp.close

    # Move temp file to origin
    FileUtils.mv(tmp.path, 'config/routes.rb')
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
      sh "rails generate scaffold #{model_name} #{attrs_list} --f"
    end

    # Generate intermediate models
    AUX_MODELS_AND_ATTRS.each do |model_name, attrs_list|
      sh "rails generate model #{model_name} #{attrs_list} --f"
    end
  end

  desc 'Destroy the models and the files generated by the scaffolding'
  task destroy: :environment do
    # Destroy the scaffolds of all models
    MODELS_AND_ATTRS.keys.each do |model_name|
      sh "rails destroy scaffold #{model_name}"
    end

    # Destroy models
    AUX_MODELS_AND_ATTRS.keys.each do |model_name|
      sh "rails destroy model #{model_name}"
    end
  end

  desc 'Builds the application data model basement by scaffolding the models'
  task reset: :environment do
    puts "Destroying scaffolds"
    Rake::Task['scaffold:destroy'].invoke
    Rake::Task['scaffold:destroy_user'].invoke

    puts "Generating scaffolds"
    Rake::Task['scaffold:build'].invoke
    Rake::Task['scaffold:create_user'].invoke

    puts "Recreating DB and seeding"
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:dev_seed'].invoke
  end
end


