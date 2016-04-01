# frozen_string_literal: true

# Public: Knows if it's applicable to reply to emoji
# and replies politely
#
module Responders
  class Emoji
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

    # Public: Should Emoji reply be applied?
    #
    # Returns true
    def apply?
      !(/^:\+?\-?\w+:/ =~ text).nil?
    end

    # Public: Reply politely
    #
    # &block - optional block to be called before documentation generation
    #
    # Returns String documentation
    def call
      yield if block_given?
      [
        "So good to talk to human!",
        "I am definitely not a toaster.",
        "Thank you!"
      ].sample
    end

    private

    attr_reader :text, :ri_doc
  end
end
