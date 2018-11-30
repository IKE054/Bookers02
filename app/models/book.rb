class Book < ApplicationRecord
  validates :title, :opinion, presence: true
  validates :opinion,    length: { maximum: 200 }

	# belongs_to :user


end
