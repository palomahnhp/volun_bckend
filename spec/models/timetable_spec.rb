require 'rails_helper'

RSpec.describe Timetable, type: :model do
  let(:timetable) { build(:timetable) }

  it 'is valid' do
    expect(timetable).to be_valid
  end
end
