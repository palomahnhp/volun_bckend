class TrackingType < ActiveRecord::Base

  AUTOMATIC_TRACKINGS = {
    subscribe:   'subscribe',
    unsubscribe: 'unsubscribe',
  }

  include Recordable
  include Archivable

  has_many :trackings, class_name: 'Volun::Tracking'

  validates :name, presence: true, uniqueness: true
  validates :alias_name, uniqueness: true, if: 'alias_name.present?'
  validate  :check_immutability, on: :update

  def self.get_volunteer_subscribe
    where(alias_name: AUTOMATIC_TRACKINGS[:subscribe]).take!
  end

  def self.get_project_subscribe
    where(alias_name: AUTOMATIC_TRACKINGS[:subscribe]).take!
  end

  def self.get_project_unsubscribe
    where(alias_name: AUTOMATIC_TRACKINGS[:unsubscribe]).take!
  end
  
  def self.get_volunteer_unsubscribe
    where(alias_name: AUTOMATIC_TRACKINGS[:unsubscribe]).take!
  end

  def to_s
    name
  end

  private

    def check_immutability
      errors.add :system, :cannot_be_modified if system_was && system_changed?
      errors.add :alias_name, :cannot_be_modified if system_was && alias_name_changed?
    end

end
