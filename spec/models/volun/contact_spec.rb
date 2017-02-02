require 'rails_helper'

RSpec.describe Volun::Contact, type: :model do
  let(:contact) { build(:contact) }

  it 'is valid' do
    expect(contact).to be_valid
  end
end
