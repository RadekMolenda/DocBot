# frozen_string_literal: true

require "spec_helper"

RSpec.describe Responders::SimpleDoc do
  let(:simple_doc) { described_class.new(text, ri_doc: ri_doc) }
  let(:text) { "Array#first" }
  let(:ri_doc) { double("RiDoc") }

  describe "#apply?" do
    it "is always true" do
      expect(simple_doc.apply?).to be(true)
    end
  end

  describe "#call" do
    it "gets the documentation from ri" do
      expect(ri_doc).to receive(:get).with(text)
      simple_doc.call
    end
  end
end
