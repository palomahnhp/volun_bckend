module ProjectTypeCommons
  extend ActiveSupport::Concern

  included do

    belongs_to :project_type, required: true
    belongs_to :project, required: true
    accepts_nested_attributes_for :project

    validate :check_project_type
    after_initialize :set_project_type
    after_initialize :build_new_project

    def self.my_type
      model_name.singular.sub(/project_type_/,'')
    end

    def my_type_i18n
      project_type ? project_type.kind_i18n : ''
    end

    private

    def set_project_type
      self.project_type_id ||= ProjectType.get_project_type(self.class.my_type).id
    end

    def build_new_project
      self.build_project unless project_id || project
    end

    def project_type_valid?
      project_type_id == ProjectType.get_project_type(self.class.my_type).id
    end

    def check_project_type
      errors.add(:project_type_id, :invalid_project_type) unless project_type_valid?
    end

  end
end