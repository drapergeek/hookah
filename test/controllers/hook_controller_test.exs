defmodule Hookah.HookControllerTest do
  use Hookah.ConnCase
  alias Hookah.Repo
  alias Hookah.Webhook
  alias Ecto.Query

  test "POST /", %{conn: conn} do
    conn = post conn, "/blah/another", %{name: "testing"}
    assert json_response(conn, 200)

    webhook = Webhook |> Query.last |> Repo.one
    assert webhook.path == "blah/another"
    assert webhook.params["name"] == "testing"
    assert webhook.remote_ip == "127.0.0.1"
  end
end
