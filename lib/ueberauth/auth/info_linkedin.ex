defmodule Ueberauth.Auth.InfoLinkedin do
  @moduledoc """
  Provides a place within the Ueberauth.Auth struct for information about the user.
  """
  alias Ueberauth.Auth.InfoLinkedin

  @type t :: %__MODULE__{
              name: binary | nil,
              first_name: binary | nil,
              last_name: binary | nil,
              email: binary | nil,
              location: binary | nil,
              description: binary | nil,
              phone: binary | nil,
              headline: binary | nil,
              positions: map
             }

  defstruct name: nil, # The best display name known to the strategy. Usually a concatenation of first and last name, but may also be an arbitrary designator or nickname for some strategies
            first_name: nil,
            last_name: nil,
            email: nil, # The e-mail of the authenticating user. Should be provided if at all possible (but some sites such as Twitter do not provide this information)
            location: nil, # The general location of the user, usually a city and state.
            description: nil, # A short description of the authenticating user.
            image: nil, # A URL representing a profile image of the authenticating user. Where possible, should be specified to a square, roughly 50x50 pixel image.
            phone: nil, #  The telephone number of the authenticating user (no formatting is enforced).
            headline: nil, # LinkedIn: Mobile developer - Lendix
            positions: %{} # Linkedin

  def valid?(%InfoLinkedin{ name: name}) when is_binary(name), do: true
  def valid?(_), do: false
end


# positions: 
# %{"
#   _total" => 1,
#   "values" => [%{"company" => %{"id" => 5365772,
#   "industry" => "Financial Services", "name" => "Lendix",
#   "size" => "11-50", "type" => "Privately Held"}, "id" => 1091700781,
#   "isCurrent" => true, "location" => %{},
#   "startDate" => %{"month" => 9, "year" => 2016},
#   "title" => "Mobile Developer"}]
# }
