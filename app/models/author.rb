class Author < ApplicationRecord
  has_many :books, dependent: :restrict_with_exception
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
end
