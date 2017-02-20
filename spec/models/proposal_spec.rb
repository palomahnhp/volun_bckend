require 'rails_helper'

RSpec.describe Proposal, type: :model do
  let(:proposal) { build(:proposal) }

  it 'is valid' do
    expect(proposal).to be_valid
  end
end
