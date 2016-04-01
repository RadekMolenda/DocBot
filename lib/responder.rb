# frozen_string_literal: true

require_relative "./responders"

# Public: Responds to client messages
#
class Responder
  REPLIES = [
    Responders::SilenceOnOptions,
    Responders::Emoji,
    Responders::SimpleDoc
  ].freeze

  # Public: Initialize Responder
  #
  # client - ClientDecorator.new(Slack::RealTime::Client.new) instance
  def initialize(client)
    @client = client
  end

  # Public: Convenient hook on :hello message from client
  # print debug data to STDOUT when bot has connected to slack
  #
  # Returns proc.
  def hello
    lambda do |_|
      puts "Connected! As: '#{client.bot_name}' to: '#{client.team}' \
        at #{client.domain}.".gsub(/ +/, " ")
    end
  end

  # Public: Convenient hook on :message message from client
  # Reply to the slack user politely only when bot is asked directly
  #
  # Returns proc.
  def message
    lambda do |data|
      return if public_conversation?(data.channel)
      response = resp(data)
      send_response(response, data)
    end
  end

  private

  attr_reader :client

  # Internal: Use available Responders to pick the best response
  #
  # Returns documentation or couldn't find documenation text String.
  def resp(data)
    REPLIES
      .lazy
      .map { |reply| reply.new(data.text, bot_name: client.bot_name) }
      .find(&:apply?)
      .call { client.typing channel: data.channel }
  end

  def send_response(message, data)
    return if message.nil?

    client.message channel: data.channel, text: message
  end

  def public_conversation?(channel)
    client.channels.keys.include?(channel)
  end
end
