require 'rails_helper'

RSpec.describe AcademicLevel, type: :model do
  let(:academic_level) { build(:academic_level) }

  it 'is valid' do
    expect(academic_level).to be_valid
  end
end
