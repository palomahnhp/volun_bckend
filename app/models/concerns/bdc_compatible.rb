module BdcCompatible
  extend ActiveSupport::Concern

  included do

    attr_accessor :bdc_validator
    before_validation :check_normalization

    def normalized?
      ndp_code.present?
    end

    def bdc_validator
      @bdc_validator ||= BdcValidator.new(bdc_fields)
    end

    def bdc_address_result
      bdc_validator.search_towns
    end

    private

    # BDC service need two white spaces in the grader field in order to look for
    # an address without a grader
    def normalize_grader
      self.grader = '  ' if grader.blank?
    end

    def check_normalization
      normalize_grader
      if bdc_validator.address_normalized?
        self.ndp_code      = bdc_validator.ndp_code
        self.latitude      = bdc_validator.latitude
        self.longitude     = bdc_validator.longitude
        self.local_code    = bdc_validator.local_code
        self.road_type_id  = RoadType.find_by(name: bdc_validator.road_type).try(:id)
      end
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