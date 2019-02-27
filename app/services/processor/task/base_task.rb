#
# Entity building process BaseHandler
#
module Processor::Task
  class BaseTask
    attr_reader :next_handler

    def initialize(next_handler = nil)
      @next_handler = next_handler
    end

    def run(entity)      
      return entity unless can_handle?(entity)
      entity = process(entity) 
      return entity unless next_handler
      next_handler.run(entity)
    end

    def can_handle?(entity)
      true
    end

    def process(entity)
      raise "'process' method should be implemented"
    end
    
  end
end