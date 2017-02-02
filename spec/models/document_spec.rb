require 'rails_helper'

RSpec.describe Document, type: :model do
  let(:document) { build(:document) }

  it 'is valid' do
    expect(document).to be_valid
  end
end
