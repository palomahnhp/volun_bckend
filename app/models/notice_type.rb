class NoticeType < ActiveRecord::Base

  has_many :users

  validates :kind, :active, presence: true

end
