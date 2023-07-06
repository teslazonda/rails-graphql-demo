quill = Person.create!(
  first_name: "Quill",
  last_name: "Cronwall",
  email: "quill@example.com",
  job_title: "Technical Writer",
  avatar: "https://www.gravatar.com/avatar/b21bbd4c0b7f75a0fbb469c238639eb7"
)

Comment.create!(
  [
    {
      person: quill,
    comment: "This is a comment from Quill Cronwall",
    },
    {
      person: quill,
      comment: "This is another comment from Quill Cronwall",
    }
  ]
)
