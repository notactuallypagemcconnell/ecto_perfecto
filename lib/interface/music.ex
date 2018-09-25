defmodule EctoPerfecto.Interface.Music do
  import Ecto.Query

  alias EctoPerfecto.{Artist, Repo}

  def search(:artist, name) do
    query =
      from david_bowie in Artist,
      where: ilike(david_bowie.name, ^name),
      select: david_bowie,
      preload: [:albums]
    case Repo.all(query) do
      [] -> {:error, "Not Found"}
      result -> {:ok, result}
    end
  end

  def search(_, _) do
    {:error, "Search interface not defined for input"}
  end
end
