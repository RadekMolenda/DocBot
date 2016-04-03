# frozen_string_literal: true

require_relative "./responders"

# Public: Responds to client messages
#         Responder uses three types of replies listed in Responder::REPLIES
#         Each reply implements two public methods:
#         `#apply?` and `#call`
#         apply? - recognizes text pattern and decides if current reply
#         should be used
#         call - returns generated documentation
#         the execution stops when `apply?` returns true.
#
#         For example - if SilenceOfOptions#apply? returns true, the Emoji
#         and SimpleDoc replies will not be processed.
#         With this pattern it should be very easy to add different replies
#         like AtMention or even MeaningOfLife and decide about their precedence
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
      puts "Connected! As: '#{client.bot_name}' to: '#{client.team_name}' \
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
  # Returns documentation or couldn't find documentation text String.
  def resp(data)
    REPLIES
      .lazy
      .map { |reply| reply.new(data.text) }
      .find(&:apply?)
      .call { client.typing(channel: data.channel) }
  end

  def send_response(message, data)
    return if message.nil?

    client.message(channel: data.channel, text: message)
  end

  def public_conversation?(channel)
    client.channels.keys.include?(channel)
  end
end
