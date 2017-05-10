class Link < ActiveRecord::Base

  #TODO Uncomment videos code when required and add to delegate

  belongs_to :linkable, polymorphic: true
  belongs_to :link_type
  belongs_to :project, -> { includes(:links).where(links: { linkable_type: 'Project' }) }, foreign_key: 'linkable_id'
  belongs_to :volunteer, -> { includes(:links).where(links: { linkable_type: 'Volunteer' }) }, foreign_key: 'linkable_id'
  belongs_to :activity, -> { includes(:links).where(links: { linkable_type: 'Activity'}) }, foreign_key: 'linkable_id'
  belongs_to :entity, -> { includes(:links).where(links: { linkable_type: 'Entity'}) }, foreign_key: 'linkable_id'


  has_attached_file :file,
                    styles: lambda{ |a|
                      return {} unless a.content_type.in? %w(image/jpeg image/png image/jpg image/gif)
                      { thumb:  '100x100#', small:  '200x200#', medium: '300x300>' }
                    },
                    default_url: '/images/missing.png',
                    url: '/system/:class/:belongs_to/:id/:attachment/:style/:filename'
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/ , if: 'logo? || image?'
  #validates_attachment_content_type :file, content_type: /\Avideo\/.*\z/ , if: 'video?'
  validates_attachment_content_type :file,
                                    content_type: %w(
                                      text/plain
                                      text/csv
                                      application/vnd.oasis.opendocument.text
                                      application/vnd.oasis.opendocument.spreadsheet
                                      application/pdf
                                      application/vnd.ms-excel
                                      application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
                                      application/msword
                                      application/vnd.openxmlformats-officedocument.wordprocessingml.document
                                    ),
                                    if: 'document?'

  validates :link_type_id, presence: true
  validates :linkable_id, :linkable_type, presence: true, unless: 'logo?'
  validates :file, presence: { message: I18n.t('must_choose_a_file')}, unless: 'url? || logo?'
  validates :path, format: { with: /\A#{URI.regexp.to_s}\z/ }, if: 'url?'
  after_save :update_path

  #delegate :logo?, :image?, :url?, :video?, :document?, :kind_i18n, to: :link_type, allow_nil: true
  delegate :logo?, :image?, :url?, :document?, :kind_i18n, to: :link_type, allow_nil: true

  scope :project_images , ->{
    includes(:project, :link_type).where(linkable_type: 'Project', link_type_id: LinkType.image.take.id)
  }
  #scope :project_videos , ->{
  #  includes(:project, :link_type).where(linkable_type: 'Project', link_type_id: LinkType.video.take.id)
  #}
  scope :project_docs   , ->{
    includes(:project, :link_type).where(linkable_type: 'Project', link_type_id: LinkType.document.take.id)
  }
  scope :project_urls   , ->{
    includes(:project, :link_type).where(linkable_type: 'Project', link_type_id: LinkType.url.take.id)
  }
  scope :project_logo, ->{
    includes(:project, :link_type).where(linkable_type: 'Project', link_type_id: LinkType.logo.take.id)
  }
  
  scope :volunteer_images , ->{
    includes(:volunteer, :link_type).where(linkable_type: 'Volunteer', link_type_id: LinkType.image.take.id)
  }
  #scope :volunteer_videos , ->{
  #  includes(:volunteer, :link_type).where(linkable_type: 'Volunteer', link_type_id: LinkType.video.take.id)
  #}
  scope :volunteer_docs   , ->{
    includes(:volunteer, :link_type).where(linkable_type: 'Volunteer', link_type_id: LinkType.document.take.id)
  }
  scope :volunteer_urls   , ->{
    includes(:volunteer, :link_type).where(linkable_type: 'Volunteer', link_type_id: LinkType.url.take.id)
  }
  scope :volunteer_logo, ->{
    includes(:volunteer, :link_type).where(linkable_type: 'Volunteer', link_type_id: LinkType.logo.take.id)
  }
  
  scope :entity_images , ->{
    includes(:entity, :link_type).where(linkable_type: 'Entity', link_type_id: LinkType.image.take.id)
  }
  #scope :entity_videos , ->{
  #  includes(:entity, :link_type).where(linkable_type: 'Entity', link_type_id: LinkType.video.take.id)
  #}
  scope :entity_docs   , ->{
    includes(:entity, :link_type).where(linkable_type: 'Entity', link_type_id: LinkType.document.take.id)
  }
  scope :entity_urls   , ->{
    includes(:entity, :link_type).where(linkable_type: 'Entity', link_type_id: LinkType.url.take.id)
  }
  scope :entity_logo, ->{
    includes(:entity, :link_type).where(linkable_type: 'Entity', link_type_id: LinkType.logo.take.id)
  }

  scope :activity_images , ->{
    includes(:activity, :link_type).where(linkable_type: 'Activity', link_type_id: LinkType.image.take.id)
  }
  #scope :activity_videos , ->{
  #  includes(:activity, :link_type).where(linkable_type: 'Activity', link_type_id: LinkType.video.take.id)
  #}
  scope :activity_docs   , ->{
    includes(:activity, :link_type).where(linkable_type: 'Activity', link_type_id: LinkType.document.take.id)
  }
  scope :activity_urls   , ->{
    includes(:activity, :link_type).where(linkable_type: 'Activity', link_type_id: LinkType.url.take.id)
  }
  scope :activity_logo, ->{
    includes(:activity, :link_type).where(linkable_type: 'Activity', link_type_id: LinkType.logo.take.id)
  }

  class << self
    delegate :logo, :file_kinds, :logo_kind, :kinds, :kinds_i18n, to: LinkType
  end

  def self.main_columns
    %i(file_file_name description linkable)
  end

  def file_extension
    file_name.sub(file_base_name, '')
  end

  def file_base_name
    file_name.match(/\A[^\.]+/).to_a.first.to_s
  end

  def file_name
    file_file_name || path.to_s.match(/[^\/]+\z/).to_a.first.to_s
  end

  Paperclip.interpolates :belongs_to  do |attachment, _style|
    link = attachment.instance
    "#{link.linkable_type}/#{link.linkable_id}/#{link.link_type.kind}"
  end

  private

  # Required by the VolunFrontend app to be fetched without the Paperclip gem
  def update_path
    update_column :path, file.url unless url?
  end

end
