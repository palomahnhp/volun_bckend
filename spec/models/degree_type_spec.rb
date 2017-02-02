require 'rails_helper'

RSpec.describe DegreeType, type: :model do
  let(:degree_type) { build(:degree_type) }

  it 'is valid' do
    expect(degree_type).to be_valid
  end
end
