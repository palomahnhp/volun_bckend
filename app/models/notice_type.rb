class NoticeType < ActiveRecord::Base

  enum kind: [:email, :sms, :script]

  has_many :users

  validates :kind, presence: true

end
