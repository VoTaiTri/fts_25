class User < ActiveRecord::Base
  enum role: [:normal, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable, :validatable
  has_many :examinations, dependent: :destroy
  
  validates :username, presence: true, uniqueness: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum:50}
end
