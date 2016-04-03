# frozen_string_literal: true

require "spec_helper"

RSpec.describe Responder do
  let(:responder) { described_class.new(client) }
  let(:client) {
    double(
      "decorated Slack::RealTime::Client",
      bot_name: "bot",
      team_name: "bot_team",
      domain: "domain",
      channels: { "OSDT3241" => double }
    )
  }
  let(:data) {
    instance_double(
      "Slack::Messages::Message",
      text: "Array#first",
      channel: "priv"
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
          receive(:typing).with(channel: "priv")
        )
        expect(client).to(
          receive(:message).with(channel: "priv", text: "message")
        )

        responder.message[data]
      end
    end

    context "when public channel" do
      let(:data) {
        instance_double(
          "Slack::Messages::Message",
          text: "Array#first",
          channel: "OSDT3241"
        )
      }

      it "doesn't send the message" do
        aggregate_failures do
          expect(client).not_to receive(:message)
          expect(client).not_to(receive(:typing))
        end
        responder.message[data]
      end
    end
  end
end
