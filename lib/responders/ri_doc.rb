# frozen_string_literal: true

module Responders
  module RiDoc
    module_function

    def get(text)
      IO.popen(
        ["ri", "-f", "markdown", "--no-pager", text], err: %i(child out), &:read
      )
    end
  end
end
