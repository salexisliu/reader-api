class Line < ApplicationRecord
  belongs_to :book
  has_one :note
end
