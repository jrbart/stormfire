defmodule FirechatWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  # Replies only to client (for testing that socket is open)
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # Broadcasts to all connections
  def handle_in("new_msg", payload, socket) do
    broadcast!(socket, "new_msg", payload)
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  # For starters everyonw is allowed
  defp authorized?(_payload) do
    true
  end
end
