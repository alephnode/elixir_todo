defmodule TodoWebWeb.TaskController do
  use TodoWebWeb, :controller

  def show(conn, %{"id" => id}) do
    task = Todo.TaskQueries.get_by_id(id)
    |> IO.inspect()

    render conn, "details.html",  task: task
  end

  def list(conn, _params) do
    tasks = Todo.TaskQueries.get_all()
    render conn, "list.html",  tasks: tasks
  end
end
