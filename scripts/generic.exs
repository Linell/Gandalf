import Gandalf

# Just a (bad) example of a possibly better way to define commands.
defmodule Gandalf.GenericCommands do
  def fart(user) do
    "#{user}: nasty self"
  end
end

command "fart", fn (speaker) -> Gandalf.GenericCommands.fart(speaker) end
