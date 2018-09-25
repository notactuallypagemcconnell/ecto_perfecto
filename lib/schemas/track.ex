defmodule EctoPerfecto.Track do
  use Ecto.Schema
  import Ecto.Changeset
  alias EctoPerfecto.{Album, Artist, Genre}

  schema "tracks" do
    belongs_to :album, Album
    belongs_to :genre, Genre

    field :name, :string
    field :composer, :string
    field :milliseconds, :integer
    field :bytes, :integer
    field :unit_price, :float

    timestamps()
  end
end
