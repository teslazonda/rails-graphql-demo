module Types
class MutationType < Types::BaseObject
  # Add a field to the MutationType that adds a new comment
  field :add_comment, Types::CommentType, null: false do
    argument :comment, String, required: true
    argument :person_id, ID, required: true
  end

  def add_comment(comment:, person_id:)
    Comment.create!(
      comment: comment,
      person_id: person_id
    )
  end

end
end
