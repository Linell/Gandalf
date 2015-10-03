defmodule Gandalf do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    children = []
    opts     = [strategy: :one_for_one, name: Gandalf.Supervisor]

    Commands.start_link
    spawn(Bridge.IRC, :run, [])

    include_scripts

    Code.require_file("gandalf.exs")

    Supervisor.start_link(children, opts)
  end

  def command(phrase, func) do
      { :ok, pattern } = Regex.compile(phrase)
      Commands.add({ pattern, func })
  end

  def include_scripts do
    scripts_directory  = Application.get_env(:gandalf, :scripts_dir)
    { _, script_list } = File.ls(scripts_directory)

    Enum.each script_list, fn (file) -> Code.require_file(file, scripts_directory) end
  end
end
