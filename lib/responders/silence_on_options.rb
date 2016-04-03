# frozen_string_literal: true

# Public: Knows if it's applicable to not generate documentation
# it prevents from passing extra options to system commands
#
module Responders
  class SilenceOnOptions
    RI_COMMAND_OPTION_REGEX = /^ *--?/
    # Public: Initialize a Responders::SimpleDoc
    #
    # text     - A String request for documentation
    def initialize(text, **_args)
      @text = text
    end

    # Public: Should SilenceOnOptions be applied?
    # check if the text from user doesn't start with single or double dash
    #
    # Returns true
    def apply?
      !(text =~ RI_COMMAND_OPTION_REGEX).nil?
    end

    # Public: Don't generate the documentation
    #
    # Returns String documentation
    def call
      "I don't know anything about '#{text}'"
    end

    private

    def text
      @text || ""
    end
  end
end
