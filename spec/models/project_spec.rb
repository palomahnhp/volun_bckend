require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { build(:project) }

  it 'is valid' do
    expect(project).to be_valid
  end
end
