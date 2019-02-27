module Processor::Task
  class Validate < BaseTask

    def process(entity)
      return entity unless entity.valid?
      entity
    end

  end
end
