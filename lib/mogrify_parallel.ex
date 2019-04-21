import Mogrify

defmodule MogrifyParallel do
  def resize_to_dim(dim) do
    {:ok, path} = File.cwd()
    Mogrify.open("input.jpg")
    |> resize_to_limit(dim)
    |> save(path: path <> "/#{dim}.jpg")
  end

  def run do
    ["1280x960","640x480","160x120","75x75","110x83","200x200","1130x850","610x458","320x240","300x225","240x180"]
    |> Enum.map(&(Task.async(fn -> resize_to_dim(&1) end)))
    |> Enum.map(&Task.await/1)
    |> IO.inspect()
  end
end
