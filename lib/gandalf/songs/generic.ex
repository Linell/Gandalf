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

end
