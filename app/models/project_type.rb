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

  def self.active?(kind)
    send(kind).take.try(:active?)
  end

  def self.get_project_type(kind)
    send(kind).take
  end

  def to_s
    kind
  end

end
