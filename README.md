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
6:59 AM <•Linell> gandalf: heya
6:59 AM <gandalf> aight Linell

```

Open `gandalf.exs` and see how you can write Gandalf commands.

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

```
6:45 PM <nicholasf> gandalf: say something or other
6:45 PM <gandalf> something or other
````

Connect to the running gandalf Erlang Node and hot load a new command remotely.

```
♪  gandalf git:(master) ✗ iex --sname bark
Erlang/OTP 17 [erts-6.0] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (0.13.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(bark@argo)1> Node.connect :gandalf@argo
true
iex(bark@argo)2> c "lib/gandalf.ex"
[Gandalf]
iex(bark@argo)2> c "lib/gandalf/commands.ex"
[Commands]
iex(bark@argo)3> import Gandalf
nil
iex(bark@argo)4> command "mirror me", &(String.reverse(&1))
:ok

```

The command will be ready in the bot. 

Add more commands in gandalf.exs or build your own exs file and parse it in the remote node:

```
iex(bark@argo)4> Code.require_file("alternate_commands.exs") 
```

## Credit

Heavily based off of [Spoonbot](https://github.com/nicholasf/spoonbot) by nicholasf.
