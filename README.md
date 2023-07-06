# README

Welcome to the rails-graphql API docs. This API was created with the help of [this post](https://groff.dev/blog/how-to-make-a-graphql-api-with-ruby-rails) by [Matthew Groff](https://groff.dev/about)

Here's what's covered:
* Sample response.
* Sample requests  
  `query {
  comments {
    id
    comment
    person {
      firstName
      lastName
      email
      createdAt
    }
  }
}
`

You can test the API with `curl` using the following command structure:
```bash
curl 'http://localhost:3000/graphql' \ 
  -X POST \
  -H 'content-type: application/json' \
  --data '{ "query": "{ comments { id comment person { firstName lastName email createdAt } } }" }'
```
This query returns a list of comments, and the person that created each comment. The sample response looks like this:
```json
{"data":{"comments":[{"id":"1ae885ef-a366-4513-a355-22fa1cd639cb","comment":"This is a comment from Quill Cronwall","person":{"firstName":"Quill","lastName":"Cronwall","email":"quill@example.com","createdAt":"2023-06-27T11:20:20Z"}},{"id":"cc21ef70-e0ea-48f7-915b-3b2b7e51617a","comment":"This is another comment from Quill Cronwall","person":{"firstName":"Quill","lastName":"Cronwall","email":"quill@example.com","createdAt":"2023-06-27T11:20:20Z"}},{"id":"4f96ff27-ab97-4a76-be44-66438ac84d09","comment":"This is a new comment","person":{"firstName":"Quill","lastName":"Cronwall","email":"quill@example.com","createdAt":"2023-06-27T11:20:20Z"}}]}}  
```

* Ruby version
*   Ruby 3.2.2

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
