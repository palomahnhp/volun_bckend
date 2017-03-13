class Setting < ActiveRecord::Base
  DEFAULT_PREFIX = "#{Rails.application.class.parent_name}."

  validates :key, presence: true, uniqueness: true

  default_scope { order(id: :asc) }

  def type
    feature_flag? ? 'feature' : 'common'
  end

  def feature_flag?
    key.sub("#{DEFAULT_PREFIX}.", '').start_with?('feature.')
  end

  def enabled?
    feature_flag? && value.present?
  end

  class << self
    def [](key)
      where(key: "#{DEFAULT_PREFIX}#{key}").pluck(:value).first.presence
    end

    def []=(key, value)
      key = "#{DEFAULT_PREFIX}#{key}"
      setting = where(key: key).first || new(key: key)
      setting.value = value.presence
      setting.save!
      value
    end

    def road_types
      self['road_types'].split(',') rescue []
    end
  end
end
