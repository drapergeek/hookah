ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Hookah.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Hookah.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Hookah.Repo)

