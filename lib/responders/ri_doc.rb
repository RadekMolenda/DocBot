# frozen_string_literal: true

# Public: Keeps the method to return documentation system `ri` command
#         `get` method is module function and should be called
#         on Responders::RiDoc module
#
# Examples
#
#   Responders::RiDoc.get("Array#first")
#   # => # Array#first
#   # => ...
module Responders
  module RiDoc
    module_function

    # Public: call system `ri` with given text
    #
    # text - The String for documentation output
    #
    # Returns ri documentation String.
    def get(text)
      IO.popen(
        ["ri", "-f", "markdown", "--no-pager", text], err: %i(child out), &:read
      )
    end
  end
end
