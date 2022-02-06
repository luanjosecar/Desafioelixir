defmodule Desafioelixir.Validation do
  def verify_floats([]), do: false

  def verify_floats(list) do
    if(Enum.all?(list, fn x -> is_float(x) end)) do
      true
    else
      false
    end
  end
end
