import Gandalf

command "say (.*)", fn (speaker, args) -> 
    Enum.at(args, 0) 
end

command "reverse (.*)", fn (speaker, args) ->
  Enum.at(args, 0) |> String.reverse
end

command "hey", fn (speaker) ->
  greetings = [
    "yo", "yoyoyo", "what's up?", "why hello there, silly Hobbit.",
    "hola", "sup", "what's crackin'"
  ]

  "#{speaker}: #{Gandalf.Songs.random greetings}"
end

command "ticker (.*)", fn (speaker, args) ->
  ticker   = Enum.at(args, 0)
  uri      = "download.finance.yahoo.com/d/quotes.csv?s=#{ticker}&f=la"

  response = Gandalf.Songs.http_get uri

  if response.success && response.response.body != "N/A,N/A\n" do
    string = String.split(response.response.body, ["/b>\","]) 
              |> tl 
              |> hd 
              |> String.split("\n") 
              |> hd

    "$#{string}"
  else
    "Well... this is embarassing, but my magic isn't working."
  end
end

command "die", &("No, you die #{&1}!")
command "quit", &("Haha, after you #{&1}!")
