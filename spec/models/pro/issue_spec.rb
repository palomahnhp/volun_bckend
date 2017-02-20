require 'rails_helper'

RSpec.describe Pro::Issue, type: :model do
  let(:issue) { build(:pro_issue) }

  it 'is valid' do
    expect(issue).to be_valid
  end
end
