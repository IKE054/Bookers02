class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true, on: :create
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :image
  # has_many :books, dependent: :destroy

  def email_required?
   false
  end
  def email_changed?
   false
  end
end
