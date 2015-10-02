defmodule Gandalf do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    children = []
    opts = [strategy: :one_for_one, name: Gandalf.Supervisor]

    Commands.start_link
    spawn(Bridge.IRC, :run, [])
    Code.require_file("gandalf.exs")

    Supervisor.start_link(children, opts)
  end

  def command(phrase, func) do
      { :ok, pattern } = Regex.compile(phrase)
      Commands.add({ pattern, func })
  end
end
