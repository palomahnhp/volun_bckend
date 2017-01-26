require File.join(Gem.loaded_specs['factory_girl_rails'].full_gem_path,
                  'lib', 'generators', 'factory_girl', 'model', 'model_generator')

module FactoryGirl
  module Generators
    class ModelGenerator < Base

      private

      def factory_definition
        <<-RUBY
  factory :#{singular_table_name}#{explicit_class_option} do
#{factory_attributes.gsub(/^/, "    ")}

    trait :invalid do
    end
  end
        RUBY
      end

      def single_file_factory_definition
        <<-RUBY
FactoryGirl.define do
#{factory_definition.chomp}
end
        RUBY
      end
    end
  end
end
