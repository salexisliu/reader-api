class Book < ApplicationRecord

  has_many :flashcards, dependent: :destroy
  has_many :lines, dependent: :destroy
  accepts_nested_attributes_for :lines

  belongs_to :user

  validates :title, :author, :user_id, presence: true
  validates :title, uniqueness: { scope: [:user_id], message: "already have title"}

end
