# frozen_string_literal: true

# Public: Knows if it's applicable to genearate documentation
# and generates the documentation
#
module Responders
  class SimpleDoc
    # Public: Initialize a Responders::SimpleDoc
    #
    # text     - A String request for documentation
    # ri_doc   - An Object generating documenation
    #            at least responding to `get` method with `text` as paramater
    # bot_name - String or nil (not used in this class)
    def initialize(text, ri_doc: RiDoc, bot_name: nil)
      @text = text
      @ri_doc = ri_doc
    end

    # Public: Should SimpleDoc be applied?
    #
    # Returns true
    def apply?
      true
    end

    # Public: Generate the documenation
    #
    # &block - optional block to be called before documentation generation
    #
    # Returns String documentation
    def call
      yield if block_given?
      ri_doc.get(text)
    end

    private

    attr_reader :text, :ri_doc
  end
end
