defmodule PresenceChat.PageController do
  use PresenceChat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", self: Node.self, nodes: Node.list
  end
end
