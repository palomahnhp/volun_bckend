# == BdcCompatible
# The class that includes this module must be an ActiveRecord subclass
# and must implement the following methods:
#
# +country+
# +province+
# +town+
# +road_type+
# +road_name+
# +road_number_type+
# +road_number+
# +grader+
# +stairs+
# +floor+
# +door+
# +ndp_code+
# +province_code+
# +town_code+
# +district_code+
# +local_code+
# +latitude+
# +longitude+
#

module BdcCompatible
  extend ActiveSupport::Concern

  included do

    attr_accessor :bdc_validator, :no_bdc_check

    before_validation :check_normalization, if: 'check_normalization?'
    validate :must_be_normalized, if: 'check_normalization?'
    after_initialize :set_default_no_bdc_check_value, if: 'persisted?'
    before_save :unnormalize, on: :update, if: 'must_not_be_normalized?'

    def normalized?
      ndp_code.present?
    end

    def normalize!
      reset_bdc_validator
      check_normalization
      ndp_code.presence
    end

    def bdc_validator
      @bdc_validator ||= BdcValidator.new(bdc_fields)
    end

    def bdc_address_result
      bdc_validator.search_towns
    end

    def reset_bdc_validator
      self.bdc_validator = nil
      self.ndp_code      = nil
      self.province_code = nil
      self.town_code     = nil
      self.district_code = nil
      self.local_code    = nil
      self.latitude      = nil
      self.longitude     = nil
    end

    private

    # BDC service need two white spaces in the grader field in order to look for
    # an address without a grader, thus an empty string will be ignored.
    def normalize_grader
      self.grader = '  ' if grader.blank?
    end

    def must_be_normalized
      unless normalized?
        errors.add :base, :address_is_not_normalized
      end
    end

    def must_not_be_normalized?
      !check_normalization?
    end

    def unnormalize
      self.ndp_code      = nil
      self.province_code = nil
      self.town_code     = nil
      self.district_code = nil
      self.local_code    = nil
      self.latitude      = nil
      self.longitude     = nil
    end

    def check_normalization?
      !(ActiveRecord::Type::Boolean.new.type_cast_from_user no_bdc_check)
    end

    def check_normalization
      self.road_number = road_number.to_s.to_i
      normalize_grader
      if bdc_validator.address_normalized?
        self.postal_code   = bdc_validator.postal_code || self.postal_code
        self.ndp_code      = bdc_validator.ndp_code
        self.province_code = bdc_validator.province_code
        self.town_code     = bdc_validator.town_code
        self.district_code = bdc_validator.district_code
        self.local_code    = bdc_validator.local_code
        self.latitude      = bdc_validator.latitude
        self.longitude     = bdc_validator.longitude
      end
    end

    def bdc_fields
      {
        country:          country.to_s,
        province:         province.to_s,
        town:             town.to_s,
        road_type:        road_type.to_s.upcase,
        road_name:        road_name.to_s,
        road_number_type: road_number_type.to_s,
        road_number:      road_number.to_s,
        grader:           grader.to_s,
        stairs:           stairs.to_s,
        floor:            floor.to_s,
        door:             door.to_s,
        bdc_exchange:     '',
        aplication:       Rails.application.secrets.bdc_app_name
      }
    end

    def set_default_no_bdc_check_value
      self.no_bdc_check ||= !normalized?
    end
  end

end