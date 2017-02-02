require 'rails_helper'

RSpec.describe InfoSource, type: :model do
  let(:info_source) { build(:info_source) }

  it 'is valid' do
    expect(info_source).to be_valid
  end
end
