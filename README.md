# Painless Table: gem for visualisation data in terminal.

## USAGE

```ruby
require 'painless-table'

table = Painless::Table.new(
  heading: [:id, :title, :created_at],
  objects: [
    {id: 10, title: 'First painless title', created_at: Time.now},
    {id: 9, title: 'Great article', created_at: Time.now},
    {id: 1089, title: 'Last post', created_at: Time.now}
  ]
)

puts table
# -----------------------------------------------------------
# |  Id  |        Title         |        Created at         |
# -----------------------------------------------------------
# | 10   | First painless title | 2017-01-03 00:47:08 +0200 |
# | 9    | Great article        | 2017-01-03 00:47:08 +0200 |
# | 1089 | Last post            | 2017-01-03 00:47:08 +0200 |
# -----------------------------------------------------------
```
