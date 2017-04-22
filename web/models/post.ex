defmodule Blog.Post do
  use Blog.Web, :model

  schema "posts" do
    field :body, :string
    timestamps()
  end

  def changeset(struct, params) do
    Ecto.Changeset.cast(struct, params, [:body])
  end
end
