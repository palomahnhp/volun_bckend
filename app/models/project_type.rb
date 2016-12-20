class ProjectType < ActiveRecord::Base

  include Archivable

  enum kind: {
    pt_social:     1,   # project_type_social
    pt_centre:     2,   # project_type_centre
    pt_permanent:  3,   # project_type_permanent
    pt_punctual:   4,   # project_type_punctual
    pt_entity:     5,   # project_type_entity
    pt_subvention: 6,   # project_type_subvention
    pt_other:      7    # project_type_other
  }

  validates :kind, presence: true

  def self.active?(kind)
    send(kind).take.try(:active?)
  end

  def self.pt_extension_tables
    kinds.keys.select { |pt_extension| pt_extension.classify.safe_constantize }
  end

  def to_s
    kind_i18n
  end

end
