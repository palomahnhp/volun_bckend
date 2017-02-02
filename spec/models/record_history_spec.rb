require 'rails_helper'

RSpec.describe RecordHistory, type: :model do
  let(:record_history) { build(:record_history) }

  it 'is valid' do
    expect(record_history).to be_valid
  end
end
