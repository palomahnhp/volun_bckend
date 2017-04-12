class NoticeType < ActiveRecord::Base

  enum kind: [:email, :sms, :script]

  has_many :users

  validates :kind, presence: true
  
  def to_s
    description
  end

end
