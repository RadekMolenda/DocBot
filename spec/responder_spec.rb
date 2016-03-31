# frozen_string_literal: true

require "spec_helper"

RSpec.describe Responder do
  let(:responder) { described_class.new(client) }
  let(:client) {
    double(
      "decorated Slack::RealTime::Client",
      bot_name: "bot",
      team: "bot_team",
      domain: "domain"
    )
  }
  let(:data) {
    double(
      "message recieved from slack",
      text: "Array#first",
      channel: "channel"
    )
  }

  it "responds to #hello" do
    expect { responder.hello[nil] }.not_to raise_error
  end

  describe "#message" do
    before do
      allow(Responders::RiDoc).to(
        receive(:get).with("Array#first").and_return("message")
      )
    end

    it "uses client to send message" do
      aggregate_failures do
        expect(client).to(
          receive(:typing).with(channel: "channel")
        )
        expect(client).to(
          receive(:message).with(channel: "channel", text: "message")
        )
      end

      responder.message[data]
    end
  end
end
