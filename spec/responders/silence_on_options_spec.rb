# frozen_string_literal: true

require "spec_helper"

RSpec.describe Responders::SilenceOnOptions do
  describe "#apply?" do
    it "returns true when text seems like ri option" do
      aggregate_failures do
        expect(described_class.new("-i").apply?).to be(true)
        expect(described_class.new("      -i    ").apply?).to be(true)
        expect(described_class.new(" --server 1243").apply?).to be(true)
        expect(described_class.new("hello--server 1243").apply?).to be_falsey
        expect(described_class.new("hello-world").apply?).to be_falsey
      end
    end
  end

  describe "#call" do
    it "returns nil" do
      expect(described_class.new("-i").call).to(
        eq("I don't know anything about '-i'")
      )
    end
  end
end
