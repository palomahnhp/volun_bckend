require 'rails_helper'

RSpec.describe Volun::KnownLanguage, type: :model do
  let(:known_language) { build(:known_language) }

  it 'is valid' do
    expect(known_language).to be_valid
  end
end
