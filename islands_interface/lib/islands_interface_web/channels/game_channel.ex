defmodule IslandsInterfaceWeb.GameChannel do
  use IslandsInterfaceWeb, :channel
  alias IslandsEngine.{Game, GameSupervisor}

  def channel do
    quote do
      use Phoenix.Channel
      import IslandsInterfaceWeb.Gettext
    end
  end

  # def handle_in("hello", payload, socket) do
  #   payload = %{message: "We forced this error."}
  #   {:reply, {:error, payload}, socket}
  # end

  # def handle_in("hello", payload, socket) do
  #   push socket, "said_hello", payload
  #   {:noreply, socket}
  # end

  # def handle_in("hello", payload, socket) do
  #   broadcast! socket, "said_hello", payload
  #   {:noreply, socket}
  # end

  def handle_in("new_game", _payload, socket) do
    "game:" <> player = socket.topic
    case GameSupervisor.start_game(player) do
      {:ok, _pid} ->
        {:reply, :ok, socket}
        {:error, reason} ->
          {:reply, {:error, %{reason: reason}}, socket}
    end
  end

  def join("game:" <> _player, _payload, socket) do
    {:ok, socket}
  end
end
