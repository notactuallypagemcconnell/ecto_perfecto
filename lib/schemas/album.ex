defmodule EctoPerfecto.Album do
  use Ecto.Schema
  import Ecto.Changeset

  schema "albums" do
    belongs_to :artist, EctoPerfecto.Artist
    belongs_to :genre, EctoPerfecto.Genre

    field :title, :string
    timestamps()
  end

  def changeset(album, attrs) do
    album
    |> cast(attrs, [:id, :title, :artist_id])
    |> validate_required([:id, :title]) 
  end
end
