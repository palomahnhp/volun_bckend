class LinkType < ActiveRecord::Base

  enum kind: {
    logo:     1,
    image:    2,
    url:      3,
    video:    4,
    document: 5
  }

  has_many :links

  scope :files, ->{ where(kind: file_kinds.values) }

  validates :kind, presence: true
  validates :kind, uniqueness: true

  def self.file_kinds
    kinds.slice(:image, :url, :video, :document)
  end

  def self.logo_kind
    kinds.slice(:logo)
  end

  def to_s
    kind_i18n
  end

end
