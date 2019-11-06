defmodule IslandsInterfaceWeb.GameChannel do
  use IslandsInterfaceWeb, :channel
  alias IslandsEngine.{Game, GameSupervisor}

  def channel do
    quote do
      use Phoenix.Channel
      import IslandsInterfaceWeb.Gettext
    end
  end

  def join("game:" <> _player, _payload, socket) do
    {:ok, socket}
  end
end
