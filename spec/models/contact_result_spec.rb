require 'rails_helper'

RSpec.describe ContactResult, type: :model do
  let(:contact_result) { build(:contact_result) }

  it 'is valid' do
    expect(contact_result).to be_valid
  end
end
