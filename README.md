# Painless Table: gem for visualisation data in terminal.

## USAGE

```
table = Painless::Table.new(
  heading: [:id, :title, :created_at],
  objects: [
    {id: 10, title: 'First painless title', created_at: Time.now},
    {id: 9, title: 'Great article', created_at: Time.now},
    {id: 1089, title: 'Last post', created_at: Time.now}
  ]
)

puts table

```
