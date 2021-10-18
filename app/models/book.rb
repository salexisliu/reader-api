class Book < ApplicationRecord

  has_many :lines
  belongs_to :user

  validates :title, :author, :user_id, presence: true
  validates :title, uniqueness: { scope: [:user_id], message: "already have title"}

end
