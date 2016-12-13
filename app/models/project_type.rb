class ProjectType < ActiveRecord::Base
  include Archivable

  enum kind: %i(
          social
          centre
          permanent
          punctual
          entity
          subvention
          other
       )

  # enum kind: {
  #   1 => :social,
  #   2 => :centre,
  #   3 => :permanent,
  #   4 => :punctual,
  #   5 => :entity,
  #   6 => :subvention,
  #   7 => :other
  # }

  validates :kind, presence: true

  def self.active?(kind)
    send(kind).take.try(:active?)
  end

  def self.get_project_type(kind)
    send(kind).take
  end

  def to_s
    kind_i18n
  end

end
