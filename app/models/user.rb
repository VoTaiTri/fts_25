class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable, :validatable
  has_many :examinations, dependent: :destroy
  
  validates :username, presence: true, length: {maximum: 50}
end
