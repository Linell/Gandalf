defmodule GandalfTest do
  use ExUnit.Case
  doctest Gandalf

  test "Has a server configuration" do
    Application.get_env(:gandalf, :server) == nil
  end

  test "Has a channel configuration" do
    Application.get_env(:gandalf, :channel) == nil
  end

end
