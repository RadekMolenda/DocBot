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
      message = REPLIES
                .lazy
                .map { |reply| reply.new(data.text, bot_name: client.bot_name) }
                .find(&:apply?)
                .call { client.typing channel: data.channel }

      send(message, data)
    end
  end

  private

  attr_reader :client

  def send(message, data)
    return if message.nil?

    client.message channel: data.channel, text: message
  end
end
