defmodule Tangledprism.CLI do

  @moduledoc """
  Handle the command line parsing and the dispatch to
  the various functions that end up analysing the dependencies
  of the specified code base
  """

  def run(argv) do
    parse_args(argv)
  end

  @doc """
  `argv` can be -h or --help, which returns :help.
  """

  def parse_args(argv) do 
    parse = OptionParser.parse(argv, switches: [ help: :boolean],
                                     aliases:  [ h:    :help])
                                     
    case parse do
    {[ help: true ], _, _ } 
      -> :help
    _ -> :help
    end

  end
end
