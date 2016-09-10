# Alpha Blog

This is a blog application made with Ruby on Rails during The Complete Ruby on Rails Developer Course

# Functionalities

- Sign Up
- Log In
- Log Out
- Articles
  - Listing
  - Single article page
  - Create -> only logged users
  - Update, Delete -> only owner and admin user
- Users
  - Listing
  - User Profile
    - Listing articles of the user
  - Update account -> only users own account
  - Delete account -> only admin user, delete all users articles as well
- Categories
  - Listing
  - Category page
    - Listing articles in the category
  - Update -> only admin user

# Model Associations

```
User **one_to_many** Article
Article **many_to_many ** Category
```

# Technologies

- Ruby 2.2.3
- Rails 4.2.6
- minitest - for automated tests
- gem will_paginate 3.0.7
- Skeleton CSS Boilerplate

# Demo

Running demo at: http://alpha-blog-diegoversiani.herokuapp.com