require 'rails_helper'

RSpec.describe Language, type: :model do
  let(:language) { build(:language) }

  it 'is valid' do
    expect(language).to be_valid
  end
end
