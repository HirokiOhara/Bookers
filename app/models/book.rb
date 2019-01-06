class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 100 }
  validates :opinion, presence: true, length: { maximum: 200 }
end
