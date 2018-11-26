class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name,uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attachment :image
  has_many :books, dependent: :destroy

  def email_required?
   false
 end
 def email_changed?
   false
 end
end
