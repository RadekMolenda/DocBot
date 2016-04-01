# frozen_string_literal: true

require_relative "../config"
require_relative "../lib/doc_bot"

DocBot.new(Slack::RealTime::Client.new).run!
