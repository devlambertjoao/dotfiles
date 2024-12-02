session_root "~/Development/"

if initialize_session "crushonu"; then
  # Run Servers
  new_window "servers"
  split_v 50
  select_pane 0
  run_cmd "cd crushonu-api && rails server"
  select_pane 1
  run_cmd "cd crushonu-web && npm run dev"

  # Api
  new_window "api"
  run_cmd "cd crushonu-api && nvim"

  # Web
  new_window "web"
  run_cmd "cd crushonu-web && nvim"

fi

finalize_and_go_to_session
