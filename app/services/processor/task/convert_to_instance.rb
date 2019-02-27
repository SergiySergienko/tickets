module Processor::Task
  class ConvertToInstance < BaseTask
    attr_reader :current_store

    def initialize(next_handler, current_store)
      @current_store = current_store
      super(next_handler)
    end

    def process(entity)
      @current_store.prepare_new(entity)
    end

  end
end