require 'rails_helper'

RSpec.describe FrontpageElement, type: :model do
  let(:frontpage_element) { build(:frontpage_element) }

  it 'is valid' do
    expect(frontpage_element).to be_valid
  end
end
