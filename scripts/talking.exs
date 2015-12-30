import Gandalf

command "let down your hair", fn (speaker) ->
  Gandalf.Songs.make_action "lets down hair"
end

command "slap (.*)", fn (speaker, args) ->
  user = Enum.at(args, 0)
  messages = [
    "lovingly carasses #{user}.", 
    "punches #{user} right in the dick!!!!",
    "refuses to slap #{user} for reasons.",
    "slaps #{user} so hard that their face melts.",
  ]

  Gandalf.Songs.random(messages) |> Gandalf.Songs.make_action
end
