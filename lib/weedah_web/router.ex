defmodule WeedahWeb.Router do
  use WeedahWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WeedahWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", WeedahWeb do
    pipe_through :api

    post "/vendor/new", VendorController, :new
    get "/vendor/:id", VendorController, :detail
    post "/search", VendorController, :get_location
  end
end
