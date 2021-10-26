class Flashcard < ApplicationRecord
  belongs_to :book
  validates :term, uniqueness: { scope: [:book_id], message: "duplicate card"}
end