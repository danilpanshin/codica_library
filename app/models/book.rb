class Book < ApplicationRecord
  validates :title, presence: true

  belongs_to :category, optional: true
  has_many :author_books, dependent: :nullify
  has_many :authors, through: :author_books
end
