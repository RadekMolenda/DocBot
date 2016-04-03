# frozen_string_literal: true

require "spec_helper"

RSpec.describe Responders::RiDoc do
  describe "RiDoc.get" do
    subject(:doc) { described_class.get(text) }
    let(:text) { "Array#first" }

    it "returns Array#first header" do
      expect(doc).to start_with("# Array#first")
    end

    it "returns valid documentation" do
      expect(doc).to include("Returns the first element, or the first `n`")
    end
    context "when asking for Elixir documentation" do
      let(:text) { "GenServer#handle_call/3" }

      it "returns nothing known message" do
        expect(doc).to eq("Nothing known about GenServer\n")
      end
    end
  end
end
