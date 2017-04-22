defmodule Blog.PostController do
  use Blog.Web, :controller

  def index(conn, _param) do
    render(conn, "post.json", %{body: "hello world"})
  end
end
