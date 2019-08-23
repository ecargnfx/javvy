require IEx

defmodule JavvyWeb.ThoughtLive do
  use Phoenix.LiveView
  alias Javvy.Brainstorm
  alias JavvyWeb.ThoughtView

  def mount(_session, socket) do
    Brainstorm.subscribe()
    #when we mount liveview it will subscribe
    {:ok, fetch(socket)}
    # load the list of thoughts
  end

  def render(assigns) do
    ThoughtView.render("thoughts.html", assigns)
    # specifies that JavvyWeb.ThoughtView view renders template thoughts.html.leex
  end

  #liveview events come in as handle event
  def handle_event("add", %{"thought" => thought}, socket) do
    Brainstorm.create_thought(thought)

    {:noreply, fetch(socket)}
  end

  #pubsub events come in as handle info, pass in module name, pass a list of anything with thought as first argument in list
  def handle_info({Brainstorm, [:thought | _], _}, socket) do
    {:noreply, fetch(socket)}
    #anytime database changes on thoughts table, we want to fetch updated list of thoughts
  end

  def handle_event("delete", %{"thought" => thought}, socket) do
    Brainstorm.delete_thought(thought)

    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, thoughts: Brainstorm.list_thoughts())
    # load socket and the list of thoughts
  end

end
