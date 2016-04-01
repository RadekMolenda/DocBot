# frozen_string_literal: true

require "simplecov"
SimpleCov.start do
  add_filter "/vendor/"
end

require_relative "../lib/doc_bot"
