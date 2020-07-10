class MovieSerializer < ActiveModel::Serializer
    attributes :id, :name, :kind
  end