defmodule Bones.PostHeroLive do
  use Bonfire.UI.Common.Web, :stateless_component

  prop activity, :map
  prop object, :map
  prop thread_title, :string

  def mount(socket) do
    {:ok, socket}
  end

  def update(assigns, socket) do
    IO.inspect(assigns, label: "CCCCCCA2")
    {:ok, socket}
  end
end
