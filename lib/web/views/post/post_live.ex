defmodule Bones.Web.PostLive do
  use Bonfire.UI.Common.Web, :surface_live_view

  on_mount {LivePlugs, [Bonfire.UI.Me.LivePlugs.LoadCurrentUser]}

  def mount(params, _session, socket) do
    # is_guest? = is_nil(current_user_id(socket.assigns))

    {:ok,
     socket
     |> assign(
       page_title: l("Post"),
       thread_title: nil,
       page: "Post",
       showing_within: :thread,
       participants: nil,
       activity: nil,
       post: nil,
       object: nil,
       object_id: nil,
       post_id: nil,
       back: true,
       thread_id: nil,
       thread_mode: maybe_to_atom(e(params, "mode", nil)),
       loading: false,
       nav_items: Bonfire.Common.ExtensionModule.default_nav()
     ),
     layout: {Bones.LayoutLive, :live}
    }
  end

  def handle_params(%{"id" => id} = params, _url, socket) when is_binary(id) do
    debug(id, "object_id")

    socket =
      socket
      |> assign(
        params: params,
        object_id: id,
        thread_id: id
        #  url: url
        #  reply_to_id: e(params, "reply_to_id", id)
      )

    with %Phoenix.LiveView.Socket{} = socket <-
           Bonfire.Social.Objects.LiveHandler.load_object_assigns(socket) do
      {:noreply, socket}
    else
      {:error, e} ->
        {:noreply, assign_error(socket, e)}

      other ->
        error(other)
        {:noreply, socket}
    end
  end
end
