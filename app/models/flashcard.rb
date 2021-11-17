class Flashcard < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :term, uniqueness: { scope: [:book_id], message: "duplicate card"}
end