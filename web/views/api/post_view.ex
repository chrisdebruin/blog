defmodule Blog.API.PostView do
  use Blog.Web, :view

  def render("index.json", %{posts: posts}) do
    render_many(posts, Blog.API.PostView, "post.json")
  end

  def render("show.json", %{post: post}) do
    render_one(post, Blog.API.PostView, "post.json")
  end

  def render("post.json", %{post: post}) do
    %{id: post.id, body: post.body, username: post.username, inserted_at: post.inserted_at, updated_at: post.updated_at}
  end

end
