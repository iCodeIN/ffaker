defmodule Ffaker.En.Name do
  import Ffaker
  @moduledoc """
  Functions for name data in English
  """
  @suffixes ~w(Jr. Sr. I II III IV V MD DDS PhD DVM)
  @female_prefixes ~w(Mrs. Miss.)
  @other_prefixes ~w(Ms. Dr.)

  @doc """
  Returns name
  """
  @spec name() :: String.t
  def name do
    "#{first_name} #{last_name}"
  end

  @doc """
  Returns html safe name
  """
  @spec html_safe_name() :: String.t
  def html_safe_name do
    "#{first_name} #{html_safe_last_name}"
  end

  @doc """
  Returns first name
  """
  @spec first_name() :: String.t
  def first_name do
    random(0..1) == 0 && female_first_name || male_first_name
  end

  @doc """
  Returns male first name
  """
  @spec male_first_name() :: String.t
  def male_first_name do
    list_file("data/en/name/first_names_male")
    |> random
  end

  @doc """
  Returns female first name
  """
  @spec female_first_name() :: String.t
  def female_first_name do
    list_file("data/en/name/first_names_female")
    |> random
  end

  @doc """
  Returns last name
  """
  @spec last_name() :: String.t
  def last_name do
    list_file("data/en/name/last_names")
    |> random
  end

  @doc """
  Returns html safe last name
  """
  @spec html_safe_last_name() :: String.t
  def html_safe_last_name do
    list_file("data/en/name/last_names")
    |> Enum.filter(&(not String.contains?(&1, "'")))
    |> random
  end

  @doc """
  Returns prefix
  """
  @spec prefix() :: String.t
  def prefix do
    case random(0..2) do
       0 -> female_prefix
       1 -> male_prefix
       _ -> other_prefix
    end
  end

  @doc """
  Returns male prefix
  """
  @spec male_prefix() :: String.t
  def male_prefix do
    "Mr."
  end

  @doc """
  Returns female prefix
  """
  @spec female_prefix() :: String.t
  def female_prefix do
    @female_prefixes
    |> random
  end

  @doc """
  Returns gender neutral prefix
  """
  @spec other_prefix() :: String.t
  def other_prefix do
    @other_prefixes
    |> random
  end

  @doc """
  Returns suffix
  """
  @spec suffix() :: String.t
  def suffix do
    @suffixes
    |> random
  end
end
