require 'rails_helper'

RSpec.describe Req::StatusTrace, type: :model do
  let(:status_trace) { build(:status_trace) }

  it 'is valid' do
    expect(status_trace).to be_valid
  end
end
