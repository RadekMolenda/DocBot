# frozen_string_literal: true

require_relative "responder"
require_relative "client_decorator"

class DocBot
  def initialize(client)
    @client = client
  end

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
