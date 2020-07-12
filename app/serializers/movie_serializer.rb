class MovieSerializer < ActiveModel::Serializer
    attributes :id, :name, :kind, :account_id
  end