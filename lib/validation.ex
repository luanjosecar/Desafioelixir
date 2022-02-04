defmodule Validation do
  def verify_floats(list) do
    if(Enum.all?(list, fn x -> not is_float(x) end)) do
      true
    else
      false
    end
  end
end
