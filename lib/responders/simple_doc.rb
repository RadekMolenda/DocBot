# frozen_string_literal: true

# Public: Knows if it's applicable to generate documentation
# and generates the documentation
#
module Responders
  class SimpleDoc
    # Public: Initialize a Responders::SimpleDoc
    #
    # text     - A String request for documentation
    # ri_doc   - An Object generating documentation
    #            at least responding to `get` method with `text` as parameter
    def initialize(text, ri_doc: RiDoc)
      @text = text
      @ri_doc = ri_doc
    end

    # Public: Should SimpleDoc be applied?
    #
    # Returns true
    def apply?
      true
    end

    # Public: Generate the documentation
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
