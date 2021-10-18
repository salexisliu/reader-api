class LineSerializer < ActiveModel::Serializer
  attributes :id, :highlighted, :content, :book_id

  has_many :notes

end
