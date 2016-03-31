# frozen_string_literal: true

require_relative "./responders"

class Responder
  REPLIES = [
    Responders::SilenceOnOptions,
    Responders::SimpleDoc
  ].freeze

  def initialize(client)
    @client = client
  end

  def hello
    lambda do |_|
      puts "Connected! As: '#{client.bot_name}' to: '#{client.team}' \
        at #{client.domain}.".gsub(/ +/, " ")
    end
  end

  def message
    lambda do |data|
      return if public_conversation?(data.channel)
      response = resp(data)
      send_response(response, data)
    end
  end

  private

  attr_reader :client

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
