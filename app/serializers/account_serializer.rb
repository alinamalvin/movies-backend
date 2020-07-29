class AccountSerializer < ActiveModel::Serializer
    attributes :id, :name, :user_id

    has_many :movies
  end