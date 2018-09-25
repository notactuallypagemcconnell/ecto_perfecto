defmodule EctoPerfecto.Interface.Music do
  import Ecto.Query

  alias EctoPerfecto.{Album, Artist, Repo}

  def search(:album, title) do
    title
    |> album_search_query
    |> Repo.all
    |> handle_result
  end

  def search(:artist, name) do
    name
    |> artist_search_query
    |> Repo.all
    |> handle_result
  end

  def search(_, _) do
    {:error, "Search interface not defined for input"}
  end

  defp artist_search_query(name) do
    from phish in Artist,
    where: ilike(phish.name, ^name),
    select: phish,
    preload: [:albums]
  end

  defp album_search_query(title) do
    from lawn_boy in Album,
    where: ilike(lawn_boy.title, ^title),
    select: lawn_boy
  end

  defp handle_result([]) do
    {:error, "Not Found"}
  end

  defp handle_result(result) when is_list(result) do
    {:ok, result}
  end

  defp handle_result(_) do
    {:error, "something weird went down"}
  end
end
