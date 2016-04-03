# frozen_string_literal: true

require "spec_helper"

RSpec.describe ClientDecorator do
  subject(:client) { described_class.new(slack_client) }

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

  it "responds to #bot_name" do
    expect(client.bot_name).to eq("slack_bot")
  end

  it "responds to #team_name" do
    expect(client.team_name).to eq("slack_bot_team")
  end

  it "responds to #domain" do
    expect(client.domain).to eq("https://team-domain.slack.com")
  end
end
