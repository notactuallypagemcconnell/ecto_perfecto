defmodule EctoPerfecto.Artist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "artists" do
    has_many :albums, EctoPerfecto.Album
    field :name, :string

    timestamps()
  end

  def changeset(artist, attrs) do
    artist
    |> cast(attrs, [:id, :name])
    |> validate_required([:id])
  end
end
