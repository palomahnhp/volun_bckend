class NoticeType < ActiveRecord::Base

  has_many :users

  validates :kind, presence: true

end
