class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :notice_type
  belongs_to :loggable, polymorphic: true #required: true
  belongs_to :manager, -> { includes(:users).where(users: { loggable_type: Manager.name }) }, foreign_key: 'loggable_id'

  validates :notice_type_id, :loggable_id, :loggable_type, presence: true

  def to_s
    login || email
  end

end
