class User < ApplicationRecord
  has_one :client, inverse_of: :user
  has_one :consignee
  has_one :notification
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, uniqueness: true
end
