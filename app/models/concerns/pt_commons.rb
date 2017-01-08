module PtCommons
  extend ActiveSupport::Concern

  included do

    has_one :project, as: :pt_extendable, required: true
    accepts_nested_attributes_for :project

    validate :check_project_type
    after_initialize :build_new_project

    private

    def project_type_valid?
      self.class.model_name.singular == project&.project_type&.kind
    end

    def check_project_type
      errors.add(:base, :invalid_project_type) unless project_type_valid?
    end

    def build_new_project(attributes = {})
      return if persisted? || project
      attributes.reverse_merge!(
        project_type: ProjectType.where(kind: ProjectType.kinds[self.class.model_name.singular]).take
      )
      build_project(attributes)
    end

  end
end