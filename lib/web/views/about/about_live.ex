defmodule Bones.Web.AboutLive do
  use Bonfire.UI.Common.Web, :surface_live_view

  def mount(_params, _session, socket) do
    {title, %{page_info: page_info, edges: edges}} =
      Bonfire.UI.Me.UsersDirectoryLive.list_users([], [], nil)

    {:ok,
     assign(
       socket,
       page: "About",
       page_title: "About",
       users: edges,
       page_info: page_info
       ),
     layout: {Bones.LayoutLive, :live}}
  end

  def handle_event("load_more", attrs, socket) do
    {title, %{page_info: page_info, edges: edges}} =
      Bonfire.UI.Me.UsersDirectoryLive.list_users(current_user(socket.assigns), attrs, e(socket.assigns, :instance_id, nil))

    {:noreply,
     socket
     |> assign(
       loaded: true,
       users: e(socket.assigns, :users, []) ++ edges,
       page_info: page_info
     )}
  end


end
