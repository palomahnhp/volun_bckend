require 'rails_helper'

RSpec.describe IdNumberType, type: :model do
  let(:id_number_type) { build(:id_number_type) }

  it 'is valid' do
    expect(id_number_type).to be_valid
  end
end
