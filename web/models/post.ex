defmodule Blog.Post do
  use Blog.Web, :model

  schema "posts" do
    field :body, :string
    field :username, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :username])
    |> validate_required([:body, :username])
  end
end
