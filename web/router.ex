defmodule Hookah.Router do
  use Hookah.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["html", "json"]
  end

  scope "/", Hookah do
    pipe_through :browser

    get "/", HookController, :index
  end

  scope "/", Hookah do
    post "/*path", HookController, :post
  end
end
