defmodule Javvy.Repo.Migrations.CreateThoughts do
  use Ecto.Migration

  def change do
    create table(:thoughts) do
      add :customer, :string
      add :problem, :string
      add :idea, :string
      add :assumption, :string

      timestamps()
    end

  end
end
