class Proposal < ActiveRecord::Base

  include Archivable

  has_many :pt_subventions

  def to_s
    name
  end

end
