defmodule Blog.PostController do
  use Blog.Web, :controller
  alias Blog.Post

  def index(conn, _param) do
    posts = Repo.all(Post)
    render(conn, "index.json", %{posts: posts})
  end

  def create(conn, %{"post" => post_params}) do
    changeset = Post.changeset(%Post{}, post_params)
    post = Repo.insert!(changeset)
    render(conn, "show.json", %{post: post})
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post0 = Repo.get!(Post, id)

    changeset = Post.changeset(post0, post_params)
    post = Repo.update!(changeset)
    render(conn, "show.json", %{post: post})
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    render(conn, "show.json", %{post: post})
  end

  def destroy(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    Repo.delete!(post)
    render(conn, "success.json", %{message: "successfuly deleted post"})
  end
end
