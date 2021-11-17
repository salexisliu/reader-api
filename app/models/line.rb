class Line < ApplicationRecord
  belongs_to :book
  has_many :notes, dependent: :destroy

  # validates :position, presence: true

end
