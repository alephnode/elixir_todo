defmodule Todo.TaskQueries do
  import Ecto.Query

  alias Todo.{Repo,Tasks}

  def get_all do
    Repo.all(from Tasks)
  end

  def get_all_incomplete do
    query = from t in Tasks,
      where: t.completed == false

      Repo.all(query)
  end

  def get_by_id(id) do
      Repo.get(Tasks, id)
  end

  def create(event) do
    Repo.insert!(event)
  end

end
