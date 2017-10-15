defmodule Todo.Tasks do
  use Ecto.Schema


  schema "tasks" do
    #by default provides id of type bigint
    field :title, :string
    field :due_date, Ecto.DateTime
    field :complete, :boolean

    #inserted at, updated at
    timestamps
  end
end
