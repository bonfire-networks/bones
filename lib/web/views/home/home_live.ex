defmodule Bones.Web.HomeLive do
  use Bonfire.UI.Common.Web, :surface_live_view
  # alias Bonfire.Me.Profiles.LiveHandler
  alias Bonfire.UI.Common.Web
  alias Bonfire.Social.Feeds.LiveHandler
  alias Bones.ArticlesLive

  on_mount {LivePlugs, [Bonfire.UI.Me.LivePlugs.LoadCurrentUser]}

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(
       page: "Home",
       selected_tab: "Home",
       #  without_sidebar: true,
       back: true,
       page_title: l("Home"),
       feed_id: :local,
       feed: nil,
       loading: false,
       page_info: nil
     ), layout: {Bones.LayoutLive, :live}}
  end
end
