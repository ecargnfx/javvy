defmodule Javvy.Repo.Migrations.ThoughtsAddVoteColumn do
  use Ecto.Migration

  def change do
    alter table("thoughts") do
      add :vote, :integer
    end
  end
end
