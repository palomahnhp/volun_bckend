require 'rails_helper'

RSpec.describe Rt::ProjectAction, type: :model do
  let(:project_action) { build(:project_action) }

  it 'is valid' do
    expect(project_action).to be_valid
  end
end
