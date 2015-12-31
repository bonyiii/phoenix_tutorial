# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rumbl.Repo.insert!(%Rumbl.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Rumbl.Repo
alias Rumbl.Category
alias Rumbl.User
alias Rumbl.Video

#User.registration_changeset(%Rumbl.User{}, %{name: "José", username: "josevalim", password: "elixir"}) |> Repo.insert
users = [
  %{name: "José", username: "josevalim", password: "elixir"},
  %{name: "Bruce", username: "redrapids", password: "7langs"},
  %{name: "Chris", username: "chrismccord", password: "phx"}
]

for user_map <- users do
  Repo.get_by(User, username: user_map[:username]) ||
  User.registration_changeset(%Rumbl.User{}, user_map) |> Repo.insert
end

for category <- ~w(Action Drama Romance Comedy Sci-Fi) do
  Repo.get_by(Category, name: category) ||
  Repo.insert!(%Category{name: category})
end
