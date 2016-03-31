# frozen_string_literal: true

module Responders
  class SimpleDoc
    def initialize(text, ri_doc: RiDoc, bot_name: nil)
      @text = text
      @ri_doc = ri_doc
    end

    def apply?
      true
    end

    def call
      yield if block_given?
      ri_doc.get(text)
    end

    private

    attr_reader :text, :ri_doc
  end
end
