defmodule JavvyWeb.PageController do
  use JavvyWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
    # this assigns index as @view_template
  end
end
