# Painless Table

gem for visualisation data in terminal.

## Installation
Add this line to your Gemfile:

` gem 'painless-table' `

and then run:

` bundle install `

Also you can install gem with:

` gem install painless-table `

## Usage

Load painless-table with string below and you can use it:

` require 'painless-table' `

## Examples

```
table = Painless::Table.new(
  heading: [:id, :title, :created_at],
  objects: [
    {id: 10, title: 'First painless title', created_at: Time.now},
    {id: 9, title: 'Great article', created_at: Time.now},
    {id: 1089, title: 'Last post', created_at: Time.now}
  ]
)

> puts table

 -----------------------------------------------------------
 |  Id  |        Title         |        Created at         |
 -----------------------------------------------------------
 | 10   | First painless title | 2017-01-03 00:47:08 +0200 |
 | 9    | Great article        | 2017-01-03 00:47:08 +0200 |
 | 1089 | Last post            | 2017-01-03 00:47:08 +0200 |
 -----------------------------------------------------------

```
