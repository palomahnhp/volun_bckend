require 'rails_helper'

RSpec.describe ProjectType, type: :model do
  let(:project_type) { build(:project_type) }

  it 'is valid' do
    expect(project_type).to be_valid
  end
end
