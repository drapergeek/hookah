defmodule Hookah.HookController do
  use Hookah.Web, :controller
  require Logger

  def post(conn, params) do
    params |> inspect |> Logger.debug
    json conn, %{}
  end
end
