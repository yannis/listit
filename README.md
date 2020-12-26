# listit

A shopping list sharing app for family members

## stack

- Rails
  - authentication: Devise
  - authorization: CanCanCan
  - Hotwire
  - Postgres
  - ActiveAdmin for admin backend
- View components
- Tailwind css
- PWA

## specs

### Procedures

1. Design some views, with basic components
1. Add Rails, Postgres, and other primary dependencies

- When a visitor
  - visits the homepage
    - and is not signed in
      - she sees an email submission form
    - and is signed in
      - and has no existing lists
        - she sees a form to create a new list
      - and has existing lists
        - she's redirected to the last visited list
  - visits a list
    - she sees:
      - a form to add an item
      - a list of existing items to buy (if any)
      - a list of crossed items (already bought)
      
