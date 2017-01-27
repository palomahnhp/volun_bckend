require 'rails_helper'

RSpec.describe LanguageLevel, type: :model do
  let(:language_level) { build(:language_level) }

  it 'is valid' do
    expect(language_level).to be_valid
  end
end
