defmodule CliTest do
  use ExUnit.Case

  import Tangledprism.CLI, only: [ parse_args: 1 ]

  test ":help returned by option parsing with -h" do
    assert parse_args(["-h", "anything"]) == :help
  end

  test ":help returned by option parsing with --help" do
    assert parse_args(["--help", "anything"]) == :help
  end

end
