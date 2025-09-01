class Genre < ApplicationRecord
  has_many :books, dependent: :restrict_with_exception
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2, maximum: 40 }
end
