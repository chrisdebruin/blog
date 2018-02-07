defmodule Blog.PostView do
  use Blog.Web, :view

  def render("index.json", %{posts: posts}) do
    %{
      posts: Enum.map(posts, &post_json/1)
    }
  end

  def post_json(post) do
    %{
      id: post.id,
      body: post.body
    }
  end
end
