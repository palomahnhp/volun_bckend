require 'rails_helper'

RSpec.describe Degree, type: :model do
  let(:degree) { build(:degree) }

  it 'is valid' do
    expect(degree).to be_valid
  end
end
