session_root "~/Development/"

if initialize_session "crushonu"; then
  # Run Servers
  new_window "servers"
  split_v 50
  select_pane 0
  run_cmd "cd crushonu-api && rails server"
  select_pane 1
  run_cmd "cd crushonu-web && npm run dev"

  # Run Utils
  new_window "api_utils"
  split_v 70
  select_pane 0
  run_cmd "cd crushonu-api && rails console"
  select_pane 1
  run_cmd "cd crushonu-api && stripe listen --forward-to localhost:3000/webhooks/stripe"

  # Api
  new_window "api"
  run_cmd "cd crushonu-api && nvim"

  # Web
  new_window "web"
  run_cmd "cd crushonu-web && nvim"

fi

finalize_and_go_to_session
