class IdNumberType < ActiveRecord::Base

  # TODO Replace this workaround to prevent the "OTROS" record from deletion, with a cleaner solution
  OTHER_TYPE_REGEX = /(?:other|otro)s?/i

  include Archivable

  validates :name, uniqueness: true
  validates :name, presence: true
  validate  :check_immutability
  before_destroy :prevent_destroying_specific_types

  def to_s
    name
  end

  def is_other_type?
    OTHER_TYPE_REGEX === to_s
  end

  private

    def prevent_destroying_specific_types
      return true unless is_other_type?

      errors.add :name, :cannot_be_deleted
      false
    end

    def check_immutability
      errors.add :name, :cannot_be_modified if OTHER_TYPE_REGEX === name_was && !(OTHER_TYPE_REGEX === name)
    end

end
