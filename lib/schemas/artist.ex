defmodule EctoPerfecto.Artist do
  use Ecto.Schema

  schema "artists" do
    has_many :albums, EctoPerfecto.Album
    field :name, :string

    timestamps()
  end
end
