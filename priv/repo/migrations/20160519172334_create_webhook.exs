defmodule Hookah.Repo.Migrations.CreateWebhook do
  use Ecto.Migration

  def change do
    create table(:webhooks) do
      add :params, :map
      add :headers, :text
      add :path, :string
      add :remote_ip, :string

      timestamps
    end

  end
end
