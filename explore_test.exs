ExUnit.start

defmodule ExploreTests do
  use ExUnit.Case, async: true

  setup_all do
    IO.puts "Starting Explore Tests"
    range = 1..5
    root = "ExploreTest"
    files = for value <- range, do: Path.join(root, "/test#{value}.txt")
    contents = for value <- range, do: "content #{value}"
    file_contents = Enum.zip(files,contents)

    create_test_files(root, file_contents)
    {:ok, [root: root, files: file_contents, count: Enum.count(range)]}
  end

  defp create_test_files(root, file_contents) do
    on_exit({:clean_up, root}, fn -> File.rm_rf(root) end)
    File.mkdir(root)
    Enum.each(file_contents, &(File.write(elem(&1, 0), elem(&1, 1))))
  end

  test "get single file contents", %{files: files} do
    first_file = List.first(files)
    single_file_path =  elem(first_file,0)
    assert Explore.get(single_file_path) == {:ok, elem(first_file, 1)}
  end

end
