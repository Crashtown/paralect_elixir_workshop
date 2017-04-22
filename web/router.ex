defmodule Blog.Router do
  use Blog.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Blog do
    pipe_through :api

    get "/", PostController, :index
  end
end
