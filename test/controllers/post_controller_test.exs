defmodule Blog.PostControllerTest do
  use Blog.ConnCase

  setup do
    conn =
      build_conn()
      |> Plug.Conn.put_req_header("content-type", "application/json")
    %{conn: conn}
  end

  test "index", %{conn: conn} do
    create_post(conn, %{post: %{body: "LOL1"}})
    create_post(conn, %{post: %{body: "LOL2"}})
    create_post(conn, %{post: %{body: "LOL3"}})
    %{"posts" => posts} = index_posts(conn)
    assert length(posts) == 3
  end

  test "show", %{conn: conn} do
    %{"post" => post0} =
      create_post(conn, %{post: %{body: "chotkij body"}})

    %{"post" => post} =
      get_post(conn, post0["id"])
    assert post["body"] == "chotkij body"
  end

  @tag :fail
  test "update", %{conn: conn} do
    %{"post" => post0} =
      create_post(conn, %{post: %{body: "chotkij body"}})
    %{"post" => post} =
      update_post(conn, post0["id"], %{post: %{body: "nechetkij body"}})
    assert post["body"] == "nechetkij body"
  end

  test "create", %{conn: conn} do
    %{"post" => post} =
      create_post(conn, %{post: %{body: "new post"}})
    assert post["body"] == "new post"
  end

  # @tag :ne_rabotaet
  # test "destroy", %{conn: conn} do
  #   post = create_post(conn, %{body: "bednij body"})
  #   destroy_post(conn, post["id"])
  #   assert_raise :error, fn -> get_post(conn, post["id"]) end
  # end

  ## Module specific functions

  defp index_posts(conn) do
    get(conn, post_path(conn, :index))
    |> json_response(200)
  end

  defp get_post(conn, id) do
    get(conn, post_path(conn, :show, id))
    |> json_response(200)
  end

  defp update_post(conn, id, params) do
    patch(conn, post_path(conn, :update, id), params)
    |> json_response(200)
  end

  defp destroy_post(conn, id) do
    destroy(conn, post_path(conn, :destroy, id))
    |> json_response(200)
  end

  defp create_post(conn, params) do
    post(conn, post_path(conn, :create), params)
    |> json_response(200)
  end
end
