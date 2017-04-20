class Activity < ActiveRecord::Base

  include Archivable

  has_many :events, as: :eventable
  has_many :links, as: :linkable
  belongs_to :entity
  belongs_to :area, ->{ where(active: true).order('areas.name asc') }
  belongs_to :project, ->{ where(active: true).order('projects.name asc') }

  accepts_nested_attributes_for :events, reject_if: :all_blank, allow_destroy: true

  validates :name, uniqueness: true
  validates :name, :description, :start_date, :transport, presence: true
  validate :start_date_less_than_end_date
  validate :check_timetables_execution_date

  scope :all_active,   ->(){ where(active: true) }
  scope :all_inactive, ->(){ where(active: false) }

  def self.main_columns
    %i(id name description start_date end_date transport entity area project share)
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |activity|
        csv << activity.attributes.values_at(*column_names)
      end
    end
  end

  def to_s
    name
  end

  private

  def start_date_less_than_end_date
    return unless start_date && end_date

    unless start_date <= end_date
      errors.add(:start_date, :execution_start_date_must_be_less_than_execution_end_date)
    end
  end

  def check_timetables_execution_date
    return unless events.any?
    validation = true
    self.events.each do |event|
      event.timetables.each do |timetable|
        if end_date?
          unless (timetable.execution_date >= start_date) && (timetable.execution_date <= end_date)
            validation = false
          end
        else
          unless (timetable.execution_date >= start_date)
            validation = false
          end
        end
        unless validation
          errors.add(:base, :timetable_must_be_between_execution_start_date_and_execution_end_date)
          return true
        end
      end
    end
  end

end
