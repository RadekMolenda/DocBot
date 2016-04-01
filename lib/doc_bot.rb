# frozen_string_literal: true

require_relative "responder"
require_relative "client_decorator"

# Public: Subscribe to socket messages and run the bot loop
#
# Example:
#
#   DocBot.new(Slack::RealTime::Client.new).run!
#
class DocBot
  # Public: Initialize DocBot
  #
  # client - Slack::RealTime::Client instance
  def initialize(client)
    @client = client
  end

  # Public: Subscbribe to socket messages and run the main loop
  #
  # Return nothing.
  def run!
    client.on :hello, &responder.hello
    client.on :message, &responder.message
    client.start!
  end

  private

  def responder
    @responder ||= Responder.new(client)
  end

  def client
    ClientDecorator.new(@client)
  end
end
