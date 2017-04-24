class IdNumberType < ActiveRecord::Base

  # TODO After the first deploy to production, replace this workaround with a cleaner solution
  # to prevent the "OTROS" record from deletion
  # This is done due to the Access DB migration to Postgresql DB
  OTHER_TYPE_REGEX = /(?:other|otro)s?/i
  CIF_TYPE_REGEX = /(?:vat|cif)s?/i

  include Archivable

  validates :name, uniqueness: true
  validates :name, presence: true
  validate  :check_immutability
  before_destroy :prevent_destroying_specific_types

  # TODO same as above
  scope :for_volunteers, ->{ search(name_not_cont: 'cif').result }

  def to_s
    name
  end

  def is_other_type?
    OTHER_TYPE_REGEX === to_s
  end

  def is_cif_type?
    CIF_TYPE_REGEX === to_s
  end

  private

    def prevent_destroying_specific_types
      return true unless is_other_type? || is_cif_type?

      errors.add :name, :cannot_be_deleted
      false
    end

    def check_immutability
      if OTHER_TYPE_REGEX === name_was && !(OTHER_TYPE_REGEX === name) ||
           CIF_TYPE_REGEX === name_was && !(CIF_TYPE_REGEX === name)
        errors.add :name, :cannot_be_modified
      end
    end

end
