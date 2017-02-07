require 'rails_helper'

RSpec.describe Rt::ProjectSubscribe, type: :model do
  let(:project_subscribe) { build(:project_subscribe) }

  it 'is valid' do
    expect(project_subscribe).to be_valid
  end
end
