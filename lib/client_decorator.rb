# frozen_string_literal: true

# Public: Decorates Slack::RealTime::Client with useful methods
#
class ClientDecorator < SimpleDelegator
  # Public: Get bot name
  #
  # Returns bot name String.
  def bot_name
    __getobj__.self.name
  end

  # Public: Get team name
  #
  # Returns team name String.
  def team_name
    __getobj__.team.name
  end

  # Public: Get slack used domain
  #
  # Returns slack teams url addres String.
  def domain
    "https://#{__getobj__.team.domain}.slack.com"
  end
end
