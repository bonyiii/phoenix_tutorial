defmodule Rumbl.Repo.Migrations.AddSlugToVidoe do
  use Ecto.Migration

  def change do
    alter table(:videos) do
      add :slug, :string
    end
  end
end
