defmodule MySuperAppWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :my_super_app

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_my_super_app_key",
    signing_salt: "1I1UiZcw",
    same_site: "Lax"
  ]

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]],
    longpoll: [connect_info: [session: @session_options]]

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :my_super_app,
    gzip: false,
    only: MySuperAppWeb.static_paths()

  plug(Plug.Static,
    at: "/moon/assets",
    from: :moon,
    gzip: true,
    only: ~w(assets themes images fonts svgs favicon.ico robots.txt),
    cache_control_for_etags: "public, max-age=86400"
  )
  
  plug(Plug.Static,
    at: "/moon_icons/",
    from: :moon_icons,
    gzip: true,
    cache_control_for_etags: "public, max-age=86400"
  )

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :my_super_app
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug MySuperAppWeb.Router
end
