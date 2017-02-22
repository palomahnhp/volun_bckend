require 'rails_helper'

RSpec.describe Pt::Centre, type: :model do
  let(:centre) { build(:centre) }

  it 'is valid' do
    expect(centre).to be_valid
  end
end
