defmodule EctoPerfecto.Genre do
  use Ecto.Schema
  import Ecto.Changeset

  schema "genres" do
    field :name

    timestamps()
  end

  def changeset(genre, attrs) do
    genre
    |> cast(attrs, [:id, :name])
    |> validate_required([:id, :name])
  end
end
