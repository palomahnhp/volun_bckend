require 'rails_helper'

RSpec.describe LinkType, type: :model do
  let(:link_type) { build(:link_type) }

  it 'is valid' do
    expect(link_type).to be_valid
  end
end
