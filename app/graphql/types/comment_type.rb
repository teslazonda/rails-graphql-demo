module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :comment, String, null: false
    field :person, Types::PersonType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
