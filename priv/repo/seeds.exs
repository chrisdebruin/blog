# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


HTTPoison.start

for i <- 1..100 do
  {:ok, response } = HTTPoison.get("http://www.randomtext.me/api")

  {:ok, json} = Poison.decode(response.body)

  Blog.Repo.insert!(%Blog.Post{username: "Chris #{i}", body: json["text_out"]})

  :timer.sleep(1000)
 end
