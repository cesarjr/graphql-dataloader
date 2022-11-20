# Possible bug in dataloader

When dataloader is used in a type, the order of resulted fields pass to be different than the requested one.

This small app shows it.

# How to run

```ruby
$ bundle install
$ bin/rails db:create
$ bin/rails db:migrate
$ bin/rspec
```
