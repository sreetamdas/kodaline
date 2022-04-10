defmodule KodalineWeb.PageController do
  use KodalineWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
