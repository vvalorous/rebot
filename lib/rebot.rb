require 'slack'
require 'logger'

require 'slack_bot_server'
require 'slack_bot_server/redis_queue'

require "rebot/version"
require "rebot/message"
require "rebot/bot"
require "rebot/conversation"

module Rebot
  def self.logger
    @logger ||= Logger.new(STDOUT)
  end

  def self.conversation(name, &block)
    @convos ||= {}
    @convos[name.to_sym] = block
  end

  def self.find_conversation(name)
    if convo = @convos[name.to_sym]
      convo
    else
      raise "Cannot find conversation: #{name}"
    end
  end

  def self.server
    @server ||= SlackBotServer::Server.new(queue: SlackBotServer::RedisQueue.new)
  end

  def self.remote_control
    @remote_control ||= begin
      require 'slack_bot_server/remote_control'
      SlackBotServer::RemoteControl.new(queue: SlackBotServer::RedisQueue.new)
    end
  end
end
