Gandalf - an IRC bot written in Elixir with a simple command syntax.

## Installation

Clone gandalf's repo.

Open config/config.exs 

```
config :gandalf, [ 
                   server:      { "irc.freenode.net", 6667, "gandalf" },
                   channel:     { "##proggit" },
                   scripts_dir: "./scripts/"
                 ]
```
Configure the conf variable with the address of the IRC server, its port, the client name, 
and the connected channel.

Start your bot.

```
elixir --sname gandalf -S mix run --no-halt
```

When the bot appears in the channel speak to it:

```
6:59 AM <Linell> gandalf: heya
6:59 AM <gandalf_bot> aight Linell

```

Open `scripts/generic.exs` and see how you can write Gandalf commands.

```
import Gandalf

command "pattern", fn(speaker) -> 
    #logic
    #return a string holding the bot's response
end
```

The simplest command takes a phrase for recognition then, followed by a comma, an anonymous 
function with one argument - the name of the speaker in the IRC chatroom. It should return a 
string to appear in the chatroom.

If you want to parse the bot's input pass in a string that can be compiled into a Regex. 
Then your function will take two arguments, the second for the arguments parsed from the 
regex.

```
command "say (.*)", fn (speaker, args) -> 
    Enum.at(args, 0) 
end
```

You can add as many files ot the scripts folder as you want. Everything in here will be
included as a command (as long as it uses the command syntax from above).

If you notice that there's something you want to do a lot of, to the point that you're 
writing a lot of repetitive code, you can create a "song" (named around 
[this](http://lotr.wikia.com/wiki/Music_of_the_Ainur)) to handle that for you. For examples
of this, check out `lib/gandalf/songs/generic.ex`. This allos you to define just about
whatever you want without cluttering up your scripts file.

```
6:45 AM <Linell> gandalf: say something or other
6:45 AM <gandalf_bot> something or other
````

## Credit

Heavily based off of [Spoonbot](https://github.com/nicholasf/spoonbot) by nicholasf.
