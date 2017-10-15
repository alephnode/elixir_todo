  Todo.TaskQueries.create(Todo.Tasks.changeset(%Todo.Tasks{}, %{title: "Do good", due_date: "2017-08-12 00:00:01"}))
  Todo.TaskQueries.create(Todo.Tasks.changeset(%Todo.Tasks{}, %{title: "Do bad", due_date: "2017-08-13 00:00:01"}))
