# README

Welcome to the rails-graphql API docs. This API was created with the help of [this post](https://groff.dev/blog/how-to-make-a-graphql-api-with-ruby-rails) by [Matthew Groff](https://groff.dev/about)

### Contents:
* [Installation](#installation)
* [Models](#models)
* [GraphQL endpoint](#graphql-endpoint)
* [GraphQL schema](#graphql-schema)
* [Queries](#queries)
* [Responses]()


## Installation
Prerequisites
* Ruby 3.2 or higher
* Posgresql installed
* Rails installed

## Models
The application includes two models: `Person` and `Comment`. The `Person` model has a one-to-many relationship with the `Comment` model, where a `Person` can have multiple comments.

## GraphQL Endpoint
```
POST /graphql
```
## GraphQL Schema
The GraphQL schema defines how data is organized within API responses.
The schema includes the following data types:

### Person
* A single person

#### Fields:
* `id` (ID!): The unique identifier of the person.
* `first_name` (String!): The first name of the person.
* `last_name` (String!): The last name of the person.
* `email` (String!): The email of the person.
* `job_title` (String!): The job_title of the person.
* `avatar` (String!): The avatar of the person.

### Comment
* A single comment

#### Fields:
* `id` (ID!): The unique identifier of the comment.
* `comment` (String!): The text data of the comment.
* `person` (PersonType!): The Person object the comment belongs to.


## Queries

The following queries are available to retrieve data from the GraphQL API:

### Fetch all Comments from all Persons
```graphql
query {
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
```

### Fetch a Person by ID
Retrieves a person by their ID
```graphql
query {
  person(id: "YOUR-PERSON-ID-HERE") {
    id
    firstName
    lastName
    email
    comments {
      id
      comment
    }
  }
}
```

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
