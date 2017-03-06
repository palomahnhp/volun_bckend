class Link < ActiveRecord::Base

  belongs_to :linkable, polymorphic: true

  enum kind: {
    logo:    1,
    image:   2,
    url:     3,
    video:   4
  }

  validates :url, presence: true

end
