defmodule Explore do
  # list files/directories
  # retrieve file(s)

  # create struct for files and directories
  # create sandbox directory that prevents navigation outside of it

  def get(file) when is_binary(file) do
    File.read(file)
  end

  def get(files) when is_list(files) do
    for file <- files, do: get(file)
  end

  def get(dir, file) when is_binary(dir) and is_binary(file) do
    Path.join(dir, file) |> get
  end

  def get(dir, files) when is_binary(dir) and is_list(files) do
    for file <- files, do: get(dir, file)
  end

  
  # def append(path_lhs, path_rhs)
  # when is_binary(path_lhs) and is_binary(path_rhs) do
  #   path_lhs = String.rstrip(path_lhs, ?/) <> "/"
  #   path_rhs = String.lstrip(path_rhs, ?/)
  #   path_lhs <> path_rhs
  # end

end
