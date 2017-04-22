defmodule Blog.PostView do
  use Blog.Web, :view

  def render("index.json", %{posts: posts}) do
    %{posts: render_many(posts, __MODULE__, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{post: render_one(post, __MODULE__, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{body: post.body,
      inserted_at: post.inserted_at,
      updated_at: post.updated_at,
      id: post.id}
  end

  def render("success.json", %{message: message}) do
    %{success: message}
  end
end
