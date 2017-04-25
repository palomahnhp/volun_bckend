class NoticeType < ActiveRecord::Base

  enum kind: [:email, :sms, :paper]

  has_many :users

  validates :kind, presence: true
  
  def to_s
    kind_i18n
  end

end
