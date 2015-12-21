defmodule Tangledprism.CLI do

  @moduledoc """
  Handle the command line parsing and the dispatch to
  the various functions that end up analysing the dependencies
  of the specified code base
  """

  def run(argv) do
    argv
      |> parse_args
      |> process
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
    {_, [ directory ], _ }
      -> { directory }
    _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage: tangledprism <directory>    
    """

    System.halt(0)
  end

  def process({directory}) do
    processDirectory([directory], "")
  end
 
  def processDirectory([], _) do end
  def processDirectory([head], parent) do
    file = Path.join(parent, head)
    if File.dir?(file) do
      IO.puts(["*** directory", file])
      processDirectory(File.ls!(file), file)
    else
      processFile(file)
    end
  end
  def processDirectory([head | tail], parent) do
    processDirectory([head], parent)
    processDirectory(tail, parent)
  end

  def processFile(file) do
    IO.puts(["*** file ",file])
  end
end
