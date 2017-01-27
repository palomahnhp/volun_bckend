require 'rails_helper'

RSpec.describe EmploymentStatus, type: :model do
  let(:employment_status) { build(:employment_status) }

  it 'is valid' do
    expect(employment_status).to be_valid
  end
end
