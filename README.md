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

Clone the repository into the desired directory, then run `bundle install` inside. Setup the database with `rails db:create` `rails db:migrate` and `rails db:seed`.

## Models
The application includes two models: `Person` and `Comment`. The `Person` model has a one-to-many relationship with the `Comment` model, where a `Person` can have multiple comments.

## GraphQL Endpoint
```
POST /graphiql
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
### Fetch all Person objects
Retrieves a list of all people in the database

```graphql
query {
  people {
    id
    firstName
    lastName
    email
  }
}
```

### Add a Comment to a Person object
Mutation that attaches a new Comment to an existing Person object

```graphql
mutation {
  addComment(
    comment: "This is a new comment"
    personId: "YOUR-PERSON-ID-HERE"
  ) {
    id
    comment
    person {
      id
      firstName
      lastName
      email
      comments {
        id
        comment
        createdAt
      }
    }
  }
}
```

### Add a new Person
Mutation that creates a new Person object

```graphql
mutation {
  addPerson(
    firstName: "Jane"
    lastName: "Doe"
    email: "jane@example.com"
    jobTitle: "Senior Design Crafter"
    avatar: "YOUR-AVATAR-URL"
  ) {
    id
    firstName
    lastName
    email
    jobTitle
    avatar
  }
}
```

You can test the API with the `curl` command. Here's an example that fetches all `Comment` objects and the `Person`they belong to:
```bash
curl 'http://localhost:3000/graphql' \
  -X POST \
  -H 'content-type: application/json' \
  --data '{ "query": "{ comments { id comment person { firstName lastName email createdAt } } }" }'
```

## Responses

Here are sample successful responses for each query:

### Fetch all Comments from all Persons
```json
{
  "data": {
    "comments": [
      {
        "id": "f5ebd6fc-356f-482c-8ed8-45bf49bdf9c7",
        "comment": "This is a comment from Quill Cronwall",
        "person": {
          "firstName": "Quill",
          "lastName": "Cronwall",
          "email": "quill@example.com",
          "createdAt": "2023-07-06T06:25:26Z"
        }
      },
      {
        "id": "379cd2e5-8e11-43e0-9292-eb782378b1d5",
        "comment": "This is another comment from Quill Cronwall",
        "person": {
          "firstName": "Quill",
          "lastName": "Cronwall",
          "email": "quill@example.com",
          "createdAt": "2023-07-06T06:25:26Z"
        }
      }
    ]
  }
}
```
### Fetch a Person by ID

```json
{
  "data": {
    "person": {
      "id": "2716107f-7d72-45cf-89f1-1dd9e285d66d",
      "firstName": "Quill",
      "lastName": "Cronwall",
      "email": "quill@example.com",
      "comments": [
        {
          "id": "f5ebd6fc-356f-482c-8ed8-45bf49bdf9c7",
          "comment": "This is a comment from Quill Cronwall"
        },
        {
          "id": "379cd2e5-8e11-43e0-9292-eb782378b1d5",
          "comment": "This is another comment from Quill Cronwall"
        }
      ]
    }
  }
}
```
### Fetch all Person objects

```json
{
  "data": {
    "people": [
      {
        "id": "2716107f-7d72-45cf-89f1-1dd9e285d66d",
        "firstName": "Quill",
        "lastName": "Cronwall",
        "email": "quill@example.com"
      }
    ]
  }
}
```

### Add a Comment to a Person object
```json
{
  "data": {
    "addComment": {
      "id": "7d422fd9-77b9-4fe5-9ccd-f244bb1c1d16",
      "comment": "This is a new comment",
      "person": {
        "id": "2716107f-7d72-45cf-89f1-1dd9e285d66d",
        "firstName": "Quill",
        "lastName": "Cronwall",
        "email": "quill@example.com",
        "comments": [
          {
            "id": "f5ebd6fc-356f-482c-8ed8-45bf49bdf9c7",
            "comment": "This is a comment from Quill Cronwall",
            "createdAt": "2023-07-06T06:25:26Z"
          },
          {
            "id": "379cd2e5-8e11-43e0-9292-eb782378b1d5",
            "comment": "This is another comment from Quill Cronwall",
            "createdAt": "2023-07-06T06:25:26Z"
          },
          {
            "id": "7d422fd9-77b9-4fe5-9ccd-f244bb1c1d16",
            "comment": "This is a new comment",
            "createdAt": "2023-07-19T10:49:40Z"
          }
        ]
      }
    }
  }
}
```
### Add a new Person
```json
{
  "data": {
    "addPerson": {
      "id": "b2bba877-a8a9-4f4a-bedd-00ef4846f959",
      "firstName": "First",
      "lastName": "Last",
      "email": "jane@example.com",
      "jobTitle": "Senior Basket Weaver",
      "avatar": "https://cdn.iconscout.com/icon/free/png-512/avatar-367-456319.png"
    }
  }
}
```
