defmodule TodoWebWeb.TaskController do
  use TodoWebWeb, :controller

  def show(conn, %{"id" => id}) do
    task = Todo.TaskQueries.get_by_id(id)
    |> IO.inspect()

    render conn, "details.html",  task: task
  end

  def create(conn, %{errors: errors}) do
    render conn, "create.html", changeset: errors
  end

  def create(conn, _params) do
    changeset = Todo.Tasks.changeset(%Todo.Tasks{}, %{})
    render conn, "create.html", changeset: changeset
  end

  def list(conn, _params) do
    tasks = Todo.TaskQueries.get_all()
    render conn, "list.html",  tasks: tasks
  end

  def add(conn, %{"tasks" => tasks}) do
    tasks = Map.update!(tasks, "due_date", fn d -> d <> ":00" end)

    changeset = Todo.Tasks.changeset(%Todo.Tasks{}, tasks)

    case Todo.TaskQueries.create changeset do
      {:ok, %{id: id}} -> redirect conn, to: task_path(conn, :show, id)
      {:error, reasons} -> create conn, %{errors: reasons}
    end

  end

end
