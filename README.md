# Trillium

## Set combinations in the Online Encyclopedia of Integer Sequences
[OEIS](https://oeis.org/A090245)

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


### Logic of a winning set
The ones column:        number of items on the face of the card
The tens column:        color (purple=0, green=1, yellow=2)
The hundreds column:    fill  (empty=0, dotted=1, solid=2)
The thousands column:   shape  (ruby=0, ?=1, ?=2)


Each column must total: 0, 3, or 6.
