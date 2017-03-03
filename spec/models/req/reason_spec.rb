require 'rails_helper'

RSpec.describe Req::Reason, type: :model do
  let(:reason) { build(:reason) }

  it 'is valid' do
    expect(reason).to be_valid
  end
end
