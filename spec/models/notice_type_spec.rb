require 'rails_helper'

RSpec.describe NoticeType, type: :model do
  let(:notice_type) { build(:notice_type) }

  it 'is valid' do
    expect(notice_type).to be_valid
  end
end
