defmodule Javvy.Brainstorm do
  @moduledoc """
  The Brainstorm context.
  """

  import Ecto.Query, warn: false
  alias Javvy.Repo

  alias Javvy.Brainstorm.Thought

  @doc """
  Returns the list of thoughts.

  ## Examples

      iex> list_thoughts()
      [%Thought{}, ...]

  """
  @topic inspect(__MODULE__)
  #inspect turns module into string, module name is Brainstorm

  def list_thoughts do
    Repo.all(Thought)
  end

  @doc """
  Gets a single thought.

  Raises `Ecto.NoResultsError` if the Thought does not exist.

  ## Examples

      iex> get_thought!(123)
      %Thought{}

      iex> get_thought!(456)
      ** (Ecto.NoResultsError)

  """
  def get_thought!(id), do: Repo.get!(Thought, id)

  @doc """
  Creates a thought.

  ## Examples

      iex> create_thought(%{field: value})
      {:ok, %Thought{}}

      iex> create_thought(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_thought(attrs \\ %{}) do
    %Thought{}
    |> Thought.changeset(attrs)
    |> Repo.insert()
    |> broadcast_change([:thought, :created])
    #broadcast event, :thought informs this is the table being affected
  end

  @doc """
  Updates a thought.

  ## Examples

      iex> update_thought(thought, %{field: new_value})
      {:ok, %Thought{}}

      iex> update_thought(thought, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_thought(%Thought{} = thought, attrs) do
    thought
    |> Thought.changeset(attrs)
    |> Repo.update()
    |> broadcast_change([:thought, :updated])
  end

  @doc """
  Deletes a Thought.

  ## Examples

      iex> delete_thought(thought)
      {:ok, %Thought{}}

      iex> delete_thought(thought)
      {:error, %Ecto.Changeset{}}

  """
  def delete_thought(%Thought{} = thought) do
    thought
    |> Repo.delete()
    |> broadcast_change([:thought, :deleted])
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking thought changes.

  ## Examples

      iex> change_thought(thought)
      %Ecto.Changeset{source: %Thought{}}

  """
  def change_thought(%Thought{} = thought) do
    Thought.changeset(thought, %{})
  end

  def subscribe do
    Phoenix.PubSub.subscribe(Javvy.PubSub, @topic)
  end

  #pulls module from handle info module. result shows what the actual change is, can help with diffing
  defp broadcast_change({:ok, result}, event) do
    Phoenix.PubSub.broadcast(Javvy.PubSub, @topic, {__MODULE__, event, result})
    {:ok, result}
  end
end
