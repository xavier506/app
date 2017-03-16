class User < ApplicationRecord
  belongs_to :client
  belongs_to :consignee
  belongs_to :notification

  USER_TYPES = ['Client','Consignee','Notify','Administrator']

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, uniqueness: true
end
