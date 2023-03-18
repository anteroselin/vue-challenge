# DataCose Vue Challenge

The goal of this challenge is to create a simple Vue app to display some dummy data retrieved over a REST api.

You are free to install any library you think is necessary to complete this challenge. We do however prefer if you use [BootstrapVue](https://bootstrap-vue.org/) components where possible.

To bootstrap this project, we've used a basic [Nuxt 2](https://nuxtjs.org/) template. There is a Dockerfile available in case you want to work with Docker during development, but this is not a requirement.

## Objectives
Start by creating a nav-bar layout on top with two buttons, each linking to one of the pages down below.

### Posts
- Create a table with the todos coming from https://jsonplaceholder.typicode.com/posts
    - Column 1: the `title` of the post as text
    - Column 2: the `body` of the post as text
- Above the table, add a text field in which you can search the table by `title`
- When you click on a table row, display a pop-up that shows the `name` of the user that created this post. The user information can be fetched from https://jsonplaceholder.typicode.com/users/{userId}/


### Todos
- Create a table with the todos coming from https://jsonplaceholder.typicode.com/todos
    - Column 1: the `title` of the todo as text
    - Column 2: a checkbox to indicate whether or not the todo has been `completed`.
- Above the table, add a text field in which you can search the table by `title`
- When you click on a table row, display a pop-up that shows the `name` of the user that created this todo. The user information can be fetched from https://jsonplaceholder.typicode.com/users/{userId}/
