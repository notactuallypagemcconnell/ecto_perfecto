defmodule EctoPerfecto.Album do
  use Ecto.Schema

  schema "albums" do
    belongs_to :artist, EctoPerfecto.Artist
    belongs_to :genre, EctoPerfecto.Genre

    field :title, :string
    timestamps()
  end
end
