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
    send(kind.to_s).take.active? rescue nil
  end

  def to_s
    kind
  end

end
