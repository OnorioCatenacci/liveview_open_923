defmodule MandatoryWeb.CounterComponent do
  use MandatoryWeb, :live_component

  alias Mandatory.MapCounter

  attr :count, :any, required: true

  def render(assigns) do
    ~H"""
      <.button phx-click="inc" phx-target={@myself}>
        Increment
      </.button>
      <p> <span class="display-counter"><%= MapCounter.show(@count) %> </span></p>
    """
  end

  def mount(socket) do
    {:ok, assign(socket, count: MapCounter.new(socket.assigns.count))}
  end

  # def update(assigns, socket) do
  #   {:ok, assign(socket, count: socket.assigns.count)}
  # end

  def handle_event("inc", _params, %{assigns: %{count: counter}} = socket) do
    updated = MapCounter.add(counter, 5)

    {:noreply, assign(socket, count: updated)}
  end
end