import Gandalf

# Enable web requests
HTTPotion.start

command "funky", &("#{&1}: you right tho") 

command "say (.*)", fn (speaker, args) -> 
    Enum.at(args, 0) 
end

command "heya", fn (speaker) -> 
    greetings = [
        "yo", "backatcha", "aight", "hi", "g'day",
    ]
    greeting = Enum.at greetings, round(:random.uniform ((Enum.count greetings) -1))
    "#{greeting} #{speaker}" 
end

command "ticker (.*)", fn (speaker, args) ->
  ticker = Enum.at(args, 0)

  response = HTTPotion.get("download.finance.yahoo.com/d/quotes.csv?s=#{ticker}&f=la")

  try do
    if HTTPotion.Response.success?(response) do
      if response.body == "N/A,N/A\n" do
        "You shall not pass (invalid input to me)."
      else
        String.split(response.body, ["/b>\","]) |> tl |> hd |> String.split("\n") |> hd
      end
    else
      "Something went wrong. Magic is hard."
    end
  rescue
    e in RuntimeError -> e
    "Something went wrong. Magic is hard."
  end
end

command "die", &("No, you die #{&1}!")
command "quit", &("Haha, after you #{&1}!")
