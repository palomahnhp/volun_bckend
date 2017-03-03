require 'rails_helper'

RSpec.describe Req::Status, type: :model do
  let(:status) { build(:status) }

  it 'is valid' do
    expect(status).to be_valid
  end
end
