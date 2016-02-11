module Rebot
  class Configuration
    # Adapter to use, currently supported: slack_bot_server and relax
    attr_accessor :adapter
    attr_accessor :adapter_options

    # Bot class
    attr_accessor :bot_class

    # TODO: validate adapters
    def initialize
      @adapter         = :slack_bot_server
      @adapter_options = {}
      @bot_class       = Rebot::Bot
    end

    def bot(bot_class = nil)
      if bot_class
        @bot_class = bot_class
      else
        @bot_class
      end
    end

    def adapter(adapter = nil, options = {})
      if adapter
        @adapter          = adapter
        @adapter_options  = options
      else
        @adapter
      end
    end

    def compile
      if self.adapter == :relax
        self.adapter_options[:relax_bots_pubsub]  ||= "relax_bots_pubsub"
        self.adapter_options[:relax_bots_key]     ||= "relax_bots_key"
        self.adapter_options[:relax_events_queue] ||= "relax_events_queue"
      end

      self
    end
  end
end