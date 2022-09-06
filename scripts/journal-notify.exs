#!/usr/bin/env elixir
defmodule JournalReader do
  def read() do
    todos = read_today_file() |> today_todos()

    case Enum.find(todos, fn (line) -> line =~ current_time() end) do
      nil -> nil
      todo -> dispatch_notification(format_todo(todo))
    end
  end

  defp format_todo(todo) do
    todo
    |> String.replace("- TODO ", "")
    |> String.replace(~r/\b\d\d:\d\d/, "")
  end

  defp dispatch_notification(todo) do
    IO.puts("Dispatch notification of #{todo}")
    System.cmd("notify-send", ["--expire-time=10000", "Task to do NOW", todo])
  end

  defp today_todos(lines) do
    lines
    |> Enum.filter(fn (line) -> line =~ "TODO" end)
  end

  defp read_today_file() do
    path = today_file_path(today_file_name())

    case File.read(path) do
      {:ok, file} -> file |> String.split("\n")
      _ -> ""
    end
  end

  defp today_file_path(name) do
    Path.expand("~/notes/journal/#{name}.md")
  end

  defp today_file_name() do
    utc_now = DateTime.utc_now()
    br_time = DateTime.add(utc_now, -3*60*60, :second)
    Calendar.strftime(br_time, "%Y-%m-%d")
  end

  defp current_time() do
    utc_now = DateTime.utc_now()
    br_time = DateTime.add(utc_now, -3*60*60, :second)
    Calendar.strftime(br_time, "%H:%M")
  end
end


JournalReader.read()


