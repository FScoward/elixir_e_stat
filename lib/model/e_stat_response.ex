defmodule EStatResponse do
  # defstruct body: nil, headers: nil, request_url: nil, status_code: nil
  @derive [Poison.Encoder]
  defstruct [:GET_STATS_DATA]
end

defmodule GetStatsData do
  @derive [Poison.Encoder]
  defstruct [:PARAMETER, :RESULT]
end

defmodule EStatResult do
  @derive [Poison.Encoder]
  defstruct [:DATE, :ERROR_MSG, :STATUS]
end

defmodule Parameter do
  @derive [Poison.Encoder]
  defstruct [:LANG, :DATA_FORMAT, :NARROWING_COND, :STATS_DATA_ID, :START_POSITION, :METAGET_FLG]
end

defmodule NarrowingCond do
  @derive [Poison.Encoder]
  defstruct [:CODE_CAT01_SELECT]
end