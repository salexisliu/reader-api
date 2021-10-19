class LineSerializer < ActiveModel::Serializer
  attributes :id, :highlighted, :content, :book_id, :position

  has_many :notes

end
