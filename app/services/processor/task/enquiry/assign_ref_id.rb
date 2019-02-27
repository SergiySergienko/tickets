module Processor::Task::Enquiry
  class AssignRefId < Processor::Task::BaseTask
    attr_reader :current_service

    def initialize(next_handler, current_service)
      @current_service = current_service
      super(next_handler)
    end

    def process(entity)
      entity.merge!({ ref_id: current_service.generate_id })
      entity
    end

  end
end