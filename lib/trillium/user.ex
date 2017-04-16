defmodule Trillium.User do
  use Ecto.Schema

  schema "users" do
    field :email, :string
    field :sets, :integer
  end
end
