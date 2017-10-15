defmodule Todo.Repo.Migrations.AddTasksTable do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, size: 50
      add :due_date, :utc_datetime

      timestamps()
    end
  end
end
