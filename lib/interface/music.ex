defmodule EctoPerfecto.Interface.Music do
  import Ecto.Query

  alias EctoPerfecto.{Album, Artist, Repo}

  @doc """
  Get all of an artists songs
  """
  def artist_songs(artist_name) do
    artist_name
    |> artist_song_query
    |> Repo.all
    |> handle_result
  end

  @doc """
  A search interface for artists and albums.
  There are two potential first arguments: `:album`, or `:artist`.
  Following these is a search term.
  For artists, their name is searched, for albums their title.
  """
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

  @doc """
  Get a count of albums for a given artist.
  This doesnt have error handling yet lol so tread lightly.
  """
  def album_count(artist) do
    artist
    |> album_count_query
    |> Repo.one
  end

  def album_count_query(artist) do
    artist_id = Repo.one(from phish in Artist, where: phish.name == ^artist, select: phish.id)

    from lawn_boy in Album,
    where: lawn_boy.artist_id == ^artist_id,
    select: count(lawn_boy.id)
  end

  #  @doc """
  #  this doesnt work but sorta shows it lol
  #  """
  #  def album_count_pipes(artist) do
  #    Album
  #    |> select([a], count(a.id))
  #    |> where([a], a.artist_id, ^artist_id)
  #    |> Repo.one
  #  end

  @doc """
  Run a raw query with your own arguments to be interpolated
  IE
  query: "SELECT power($1, $2)

  """
  def raw_query(query, args) do
    Ecto.Adapters.SQL.query(Repo, query, args)
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

  defp artist_song_query(artist) do
    from t in EctoPerfecto.Track,
    join: a in assoc(t, :album),
    join: art in assoc(a, :artist),
    where: art.name == ^artist,
    select: %{track_name: t.name, artist_name: art.name}
  end
end
