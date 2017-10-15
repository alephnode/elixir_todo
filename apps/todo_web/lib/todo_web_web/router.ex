defmodule TodoWebWeb.Router do
  use TodoWebWeb, :router

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

  scope "/", TodoWebWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/tasks", TaskController, :list
    get "/tasks/new", TaskController, :create
    post "/tasks/new", TaskController, :add
    get "/tasks/:id", TaskController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", TodoWebWeb do
  #   pipe_through :api
  # end
end
