require 'rails_helper'

RSpec.describe Skill, type: :model do
  let(:skill) { build(:skill) }

  it 'is valid' do
    expect(skill).to be_valid
  end
end
