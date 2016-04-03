# frozen_string_literal: true

require "spec_helper"

RSpec.describe ClientDecorator do
  let(:slack_client) {
    instance_double(
      "Slack::RealTime::Client",
      self: instance_double(
        "Slack::RealTime::Models::User",
        name: "slack_bot"
      ),
      team: instance_double(
        "Slack::RealTime::Models::Team",
        name: "slack_bot_team",
        domain: "team-domain"
      )
    )
  }
  let(:client) { described_class.new(slack_client) }

  it "decorates client" do
    aggregate_failures "api" do
      expect(client.bot_name).to eq "slack_bot"
      expect(client.team_name).to eq "slack_bot_team"
      expect(client.domain).to eq "https://team-domain.slack.com"
    end
  end
end
