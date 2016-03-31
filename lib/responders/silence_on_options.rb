# frozen_string_literal: true

module Responders
  class SilenceOnOptions
    def initialize(text, ri_doc: nil, bot_name: nil)
      @text = text
    end

    def apply?
      text =~ / *--?/ && true
    end

    def call
      "I don't know anything about '#{text}'"
    end

    private

    def text
      @text || ""
    end
  end
end
