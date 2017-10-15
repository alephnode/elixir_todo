defmodule Todo.Tasks do
  use Ecto.Schema

  import Ecto.Changeset


  schema "tasks" do
    #by default provides id of type bigint
    field :title, :string
    field :due_date, Ecto.DateTime
    field :completed, :boolean

    #inserted at, updated at
    timestamps
  end
  #a at end tells elixir to make these atoms, w tells its a wordlist

  @required_fields ~w(title due_date)a
  @optional_fields ~w(completed)a

  def changeset(task, params  \\ %{}) do
    task
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end

end
