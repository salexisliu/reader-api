class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :bio, :password_digest
end