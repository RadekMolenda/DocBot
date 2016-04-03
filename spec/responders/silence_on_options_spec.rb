# frozen_string_literal: true

require "spec_helper"

RSpec.describe Responders::SilenceOnOptions, type: :responders do
  describe "#apply?" do
    it "is true when text seems like ri command option", :aggregate_failures do
      expect(described_class.new("-i").apply?).to be(true)
      expect(described_class.new("      -i    ").apply?).to be(true)
      expect(described_class.new(" --server 1243").apply?).to be(true)
      expect(described_class.new("hello--server 1243").apply?).to be(false)
      expect(described_class.new("hello-world").apply?).to be(false)
    end
  end

  describe "#call" do
    it "returns message it nothing known about options" do
      expect(described_class.new("-i").call).to(
        eq("I don't know anything about '-i'")
      )
    end
  end
end
