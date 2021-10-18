class Line < ApplicationRecord
  belongs_to :book
  has_many :notes
end
