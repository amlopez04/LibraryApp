class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many   :reviews, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2, maximum: 120 }
  validates :description, length: { maximum: 1000 }, allow_blank: true
end
