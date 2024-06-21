defmodule Bones.Web.SettingsLive do
  use Bonfire.UI.Common.Web, :surface_live_view
  # alias Bonfire.Me.Profiles.LiveHandler

  on_mount {LivePlugs, [Bonfire.UI.Me.LivePlugs.LoadCurrentUser]}

  def mount(_params, _session, socket) do
    current_user = current_user_required!(socket)

    {:ok,
    socket
    |> assign(
      page: "local",
      selected_tab: "local",
      #  without_sidebar: true,
      back: true,
      page_header_icon: "carbon:notification",
      page_title: l("local"),
      feedback_title: l("You have no local"),
      feedback_message:
        l(
          "Did you know you can customise which activities you want to be notified for in your settings ?"
        ),
      feed_id: :local,
      feed: nil,
      loading: false,
      page_info: nil
      #  feed: e(feed, :edges, []),
      #  page_info: e(feed, :page_info, []),
    ),
      layout: {Bones.LayoutLive, :live}
    }
  end
end
