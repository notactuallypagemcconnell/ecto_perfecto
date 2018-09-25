defmodule EctoPerfecto.Interface.Music do
  import Ecto.Query

  alias EctoPerfecto.{Album, Artist, Repo}

  def search(:album, title) do
    query =
      from lawn_boy in Album,
      where: ilike(lawn_boy.title, ^title),
      select: lawn_boy

    case Repo.all(query) do
      []     -> {:error, "Not Found"}
      result -> {:ok, result}
    end
  end

  def search(:artist, name) do
    query =
      from phish in Artist,
      where: ilike(phish.name, ^name),
      select: phish,
      preload: [:albums]

    case Repo.all(query) do
      []     -> {:error, "Not Found"}
      result -> {:ok, result}
    end
  end

  def search(_, _) do
    {:error, "Search interface not defined for input"}
  end
end
