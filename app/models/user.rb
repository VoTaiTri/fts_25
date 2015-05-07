class User < ActiveRecord::Base
  has_many :examinations, dependent: :destroy
end
