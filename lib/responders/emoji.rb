# frozen_string_literal: true

# Public: Knows if it's applicable to reply to emoji
# and replies politely
#
module Responders
  class Emoji
    MESSAGE_START_WITH_EMOJI = /^:\+?\-?\w+:/
    # Public: Initialize a Responders::SimpleDoc
    #
    # text     - A String request for documentation
    def initialize(text, **_args)
      @text = text
    end

    # Public: Should Emoji reply be applied?
    #
    # Returns true
    def apply?
      !(MESSAGE_START_WITH_EMOJI =~ text).nil?
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

    attr_reader :text
  end
end
