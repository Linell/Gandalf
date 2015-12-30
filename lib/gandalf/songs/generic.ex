defmodule Gandalf.Songs do
  @moduledoc """
  Provides helper methods for Gandalf.
  """

  @doc """
  Return a random element from the list.
  """
  def random(list) do
    :random.seed(:os.timestamp)
    list |> Enum.shuffle |> hd
  end

  @doc """
  Fetch the given URL and return a the success status and the response.
  """
  def http_get(uri) do
    HTTPotion.start

    response = HTTPotion.get(uri)

    %{
      :success  => HTTPotion.Response.success?(response),
      :response => response
    }
  end

  @doc """
  Transforms a given string into an IRC action. Emulates typing `/me does stuff` in an IRC
  client.
  """
  def make_action(string) do
    "\u0001ACTION #{string}\u0001"
  end

end
