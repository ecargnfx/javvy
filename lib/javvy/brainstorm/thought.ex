defmodule Javvy.Brainstorm.Thought do
  use Ecto.Schema
  import Ecto.Changeset

  schema "thoughts" do
    field :assumption, :string
    field :customer, :string
    field :idea, :string
    field :problem, :string
    field :vote, :integer

    timestamps()
  end

  @doc false
  def changeset(thought, attrs) do
    thought
    |> cast(attrs, [:customer, :problem, :idea, :assumption, :vote])
    # |> validate_required([:customer, :problem, :idea, :assumption])
  end
end
