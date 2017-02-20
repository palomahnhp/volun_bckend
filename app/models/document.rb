class Document < ActiveRecord::Base

  belongs_to :project, required: true

  def to_s
    name
  end

end
