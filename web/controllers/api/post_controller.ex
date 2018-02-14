defmodule Blog.API.PostController do
  use Blog.Web, :controller

  alias Blog.Post

  def index(conn, params) do
    page = Post
           |> order_by(asc: :id)
           |> Repo.paginate(params)

    render(conn, "index.json", posts: page.entries)
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    render(conn, "show.json", post: post)
  end
end
