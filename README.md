Snom Call Monitor
----------------

Some like that should work:

morbo script/snom_monitor
set Action_URL to: http://<yourip>:3000/ring?number=$call-id&display_remote=$display_remote
