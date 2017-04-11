class Resource < ActiveRecord::Base

  has_many :permissions
  has_many :managers

  after_create :set_alias_name, on: :create
  after_validation :check_alias_name_immutability, on: :update

  def to_s
    name
  end

  private

  def set_alias_name
    update_column :alias_name, "#{Resource.name.underscore}_#{id.to_s.rjust(3, '0')}"
  end

  def check_alias_name_immutability
    unless alias_name == alias_name_was
      errors.add :alias_name, :cannot_change
    end
  end

end
