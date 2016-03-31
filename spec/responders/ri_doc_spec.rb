# frozen_string_literal: true

require "spec_helper"

RSpec.describe Responders::RiDoc do
  describe "RiDoc.get" do
    it "gets the documentation from ri" do
      doc = described_class.get("Array#first")
      aggregate_failures do
        expect(doc).to start_with "# Array#first"
        expect(doc).to include "Returns the first element, or the first `n`"
      end
    end

    it "returns ri nothing known message for Elixir 'GenServer'" do
      expect(described_class.get("GenServer#handle_call/3")).to(
        eq "Nothing known about GenServer\n"
      )
    end
  end
end
