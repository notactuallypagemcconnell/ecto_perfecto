defmodule EctoPerfecto.Genre do
  use Ecto.Schema

  schema "genres" do
    field :name

    timestamps()
  end
end
