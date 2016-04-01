# frozen_string_literal: true

# Public: Knows if it's applicable to not genearate documentation
# it prevents from passing extra options to system commands
#
module Responders
  class SilenceOnOptions
    # Public: Initialize a Responders::SimpleDoc
    #
    # text     - A String request for documentation
    # ri_doc   - An Object generating documenation
    #            at least responding to `get` method with `text` as paramater
    #            (not used in this class)
    # bot_name - String or nil (not used in this class)
    def initialize(text, ri_doc: nil, bot_name: nil)
      @text = text
    end

    # Public: Should SilenceOnOptions be applied?
    # check if the text from user doesn't start with single or double dash
    #
    # Returns true
    def apply?
      !(text =~ /^ *--?/).nil?
    end

    # Public: Don't generate the documenation
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
