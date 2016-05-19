defmodule Hookah.HookController do
  use Hookah.Web, :controller
  alias Hookah.Webhook
  alias Hookah.Repo

  require Logger

  def index(conn, _params) do
    webhooks = Repo.all(Webhook)

    conn
    |> assign(:webhooks, webhooks)
    |> render(:index)
  end

  def post(conn, params) do
    params |> inspect |> Logger.debug
    webhook_params = %{
      path: stringify_path(conn.path_info),
      params: params,
      remote_ip: stringify_ip(conn.remote_ip),
      headers: inspect(conn.req_headers),
    }
    Webhook.changeset(%Webhook{}, webhook_params)
    |> Repo.insert!

    json conn, %{}
  end

  def stringify_path(list) do
    Enum.join(list, "/")
  end

  def stringify_ip({first, second, third, fourth}) do
    Enum.join([first, second, third, fourth], ".")
  end
end
