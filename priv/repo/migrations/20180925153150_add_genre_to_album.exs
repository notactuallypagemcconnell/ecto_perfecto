defmodule EctoPerfecto.Repo.Migrations.AddGenreToAlbum do
  use Ecto.Migration

  def change do
    alter table(:albums) do
      add :genre_id, references(:genres)
    end
  end
end
