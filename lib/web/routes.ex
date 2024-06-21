defmodule Bones.Web.Routes do
  def declare_routes, do: nil

  defmacro __using__(_) do
    quote do
      # pages anyone can view
      scope "/bones/", Bones.Web do
        pipe_through(:browser)
        # pipe_through(:blog)
        # live_session :default, root_layout: "root.html.heex" do
          live("/", HomeLive)
          live("/about", AboutLive)
          live("/post/:id", PostLive, as: Needle.Pointer)
          # end
      end

      # pages only guests can view
      scope "/bones/", Bones.Web do
        pipe_through(:browser)
        pipe_through(:guest_only)
      end

      # pages you need an account to view
      scope "/bones/", Bones.Web do
        pipe_through(:browser)
        pipe_through(:account_required)
      end

      # pages you need to view as a user
      scope "/bones/", Bones.Web do
        pipe_through(:browser)
        pipe_through(:user_required)
        live("/settings", SettingsLive)
      end

      # pages only admins can view
      scope "/bones/admin", Bones.Web do
        pipe_through(:browser)
        pipe_through(:admin_required)
      end
    end
  end
end
