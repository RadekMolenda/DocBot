# frozen_string_literal: true

require "slack-ruby-client"

Slack.configure do |config|
  config.token = ENV["SLACK_API_TOKEN"]
  raise "Missing ENV[SLACK_API_TOKEN]!" unless config.token
end

client = Slack::RealTime::Client.new

client.on :hello do
  puts "Connected! As: '#{client.self.name}' to: '#{client.team.name}' \
    at https://#{client.team.domain}.slack.com.".gsub(/ +/, " ")
end

client.on :message do |data|
  puts data
  client.typing channel: data.channel
  IO.popen(["ri", "-f", "markdown", data.text], err: [:child, :out]) do |ri_io|
    client.message channel: data.channel, text: ri_io.read
  end
end

client.start!
