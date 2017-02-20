require 'rails_helper'

RSpec.describe ContactType, type: :model do
  let(:contact_type) { build(:contact_type) }

  it 'is valid' do
    expect(contact_type).to be_valid
  end
end
