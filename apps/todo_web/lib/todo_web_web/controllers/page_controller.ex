defmodule TodoWebWeb.PageController do
  use TodoWebWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
