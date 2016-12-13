class Address < ActiveRecord::Base

  attr_accessor :bdc_validator

  ROAD_NUMBER_TYPES = %w(num km.)
  GRADERS = [*'A'..'Z']

  has_and_belongs_to_many :projects
  belongs_to :road_type
  belongs_to :province

  validates :road_type_id, :road_name, :road_number, :postal_code, :province, :country, :town, presence: true
  after_validation :check_normalization

  def normalized?
    ndp_code.present? || bdc_validator.address_normalized?
  end

  def bdc_validator
    @bdc_validator ||= BdcValidator.new(bdc_fields)
  end

  private

  def check_normalization
    self.ndp_code ||= bdc_validator.ndp_code if normalized?
  end

  def bdc_fields
    {
        country:          country,
        province:         province.name,
        town:             town,
        road_type:        road_type.name,
        road_name:        road_name,
        road_number_type: road_number_type,
        road_number:      road_number,
        grader:           grader,
        stairs:           stairs,
        floor:            floor,
        door:             door,
        bdc_exchange:     '',
        aplication:       ''
    }
  end
end
