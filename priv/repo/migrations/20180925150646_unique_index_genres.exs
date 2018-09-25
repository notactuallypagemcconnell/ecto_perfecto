defmodule EctoPerfecto.Repo.Migrations.AddCategories do
  use Ecto.Migration

  def change do
    create unique_index(:genres, [:name])
  end
end
