module Processor::Task
  class PushToStore < BaseTask
    attr_reader :current_store

    def initialize(next_handler, current_store)
      @current_store = current_store
      super(next_handler)
    end

    def can_handle?(entity)
      entity.errors.empty?
    end

    def process(entity)
      current_store.create(entity)
    end

  end
end
