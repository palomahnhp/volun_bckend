require 'rails_helper'

RSpec.describe Rt::ProjectUnsubscribe, type: :model do
  let(:project_unsubscribe) { build(:project_unsubscribe) }

  it 'is valid' do
    expect(project_unsubscribe).to be_valid
  end
end
