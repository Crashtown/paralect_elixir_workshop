defmodule Blog.PostView do
  use Blog.Web, :view

  def render("post.json", post) do
    %{body: post.body}
  end
end
