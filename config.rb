# frozen_string_literal: true

require "slack-ruby-client"
require "celluloid"

def config_fail
  raise(
    KeyError,
    'ENV["SLACK_API_TOKEN"] - ENV key not found "SLACK_API_TOKEN"'
  )
end

Slack.configure do |config|
  config.token = ENV["SLACK_API_TOKEN"] || config_fail
end
