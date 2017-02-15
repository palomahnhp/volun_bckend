class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :notice_type
  belongs_to :loggable, polymorphic: true, required: true

  validates :notice_type_id, presence: true

  def to_s
    login || email
  end

end
