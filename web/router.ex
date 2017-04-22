defmodule Blog.Router do
  use Blog.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Blog do
    pipe_through :api

    # CRUDYG
    get "/posts", PostController, :index
    post "/posts", PostController, :create
    patch "/posts/:id", PostController, :update
    get "/posts/:id", PostController, :show
  end
end
