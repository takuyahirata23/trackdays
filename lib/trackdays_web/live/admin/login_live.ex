defmodule TrackdaysWeb.Admin.LoginLive do
  use TrackdaysWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>
      <h1>Log in</h1>
      <.simple_form for={@form} id="login_form" action={~p"/admin/log_in"} phx-update="ignore">
        <.input field={@form[:email]} type="email" label="Email" required />
        <.input field={@form[:password]} type="password" label="Password" required />

        <:actions>
          <.button phx-disable-with="Signing in..." class="w-full">
            Sign in <span aria-hidden="true">→</span>
          </.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def mount(_, _, socket) do
    email = live_flash(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form)}
  end
end
