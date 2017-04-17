class LoginManager

  attr_accessor :errors, :user, :manager, :login_data

  def initialize(options = {})
    self.login_data = options[:login_data]
    self.errors     = []
  end

  def valid?
    unless required_data_present?
      errors << I18n.t('errors.missing_required_fields')
    end
    errors.blank?
  end

  def find_or_create_user
    return unless valid?

    self.user = User.find_by(login: login_data[:login])
    unless user
      ActiveRecord::Base.transaction do
        self.user = User.new(
          loggable:              find_or_create_manager,
          login:                 login_data[:login],
          email:                 login_data[:email],
          password:              login_data[:document],
          password_confirmation: login_data[:document]
        )
        copy_errors_from!(user) unless user.save
      end
    end
    user
  end

  def find_or_create_manager
    return unless valid?

    self.manager   = Manager.search(login_eq: login_data[:login], uweb_id_eq: login_data[:uweb_id], m: 'or').result.take
    self.manager ||= Manager.new(login_data.merge(role: Role.internal_staff.take))
    set_default_permissions(manager)
    copy_errors_from!(manager) unless manager.save

    manager
  end

  def login_data=(hash)
    @login_data = hash.present? ? hash.symbolize_keys : hash
  end

  private

  def copy_errors_from(record)
    self.errors += record.errors.full_messages
    nil
  end

  def copy_errors_from!(record)
    copy_errors_from(record)
    raise ActiveRecord::Rollback
  end

  def required_data_present?
    %i(login uweb_id email document).all? { |key| login_data.key? key }
  end

  def set_default_permissions(manager)
    Resource.all.each do |resource|
      manager.permissions.build(resource: resource,
                                can_create:  true,
                                can_read:    true,
                                can_update:  true,
                                can_destroy: true)
    end
  end

end