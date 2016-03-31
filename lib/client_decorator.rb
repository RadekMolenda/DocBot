# frozen_string_literal: true

class ClientDecorator < SimpleDelegator
  def bot_name
    __getobj__.self.name
  end

  def team
    __getobj__.team.name
  end

  def domain
    "https://#{__getobj__.team.domain}.slack.com"
  end
end
