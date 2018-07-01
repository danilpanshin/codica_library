class Book < ApplicationRecord
  validates :title, presence: true

  belongs_to :category, optional: true
  has_many :author_books, dependent: :nullify
  has_many :authors, through: :author_books

  accepts_nested_attributes_for :authors, reject_if: :all_blank, allow_destroy: true


  mount_uploader :cover, CoverUploader

end
