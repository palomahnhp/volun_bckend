module BdcCompatible
  extend ActiveSupport::Concern

  included do

    attr_accessor :bdc_validator
    after_validation :check_normalization

    def normalized?
      ndp_code.present? || bdc_validator.address_normalized?
    end

    def bdc_validator
      @bdc_validator ||= BdcValidator.new(bdc_fields)
    end

    def bdc_address_result
      bdc_validator.search_towns
    end

    private

    def check_normalization
      self.ndp_code ||= bdc_validator.ndp_code if normalized?
    end

    def bdc_fields
      {
        country:          country.to_s,
        province:         province.to_s,
        town:             town.to_s,
        road_type:        road_type.to_s,
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
  end

end