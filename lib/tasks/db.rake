namespace :db do
  desc "Resets the database and loads it from db/dev_seeds.rb"
  task dev_seed: :environment do
    load(Rails.root.join("db", "dev_seeds.rb"))
  end
  desc "Loads old migrated data from db/custom_seeds.rb"
  task custom_seed: :environment do
    load(Rails.root.join("db", "custom_seeds.rb"))
  end
end
