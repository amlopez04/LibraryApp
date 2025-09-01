class Review < ApplicationRecord
  belongs_to :book
  validates :reviewer_name, presence: true, length: { maximum: 50 }
  validates :body,          presence: true, length: { minimum: 2, maximum: 1000 }
  validates :rating,        inclusion: { in: 1..5 }
end
