module Processor::Task::Comment
  class SendEmail < Processor::Task::BaseTask
    attr_reader :current_mailer

    def initialize(next_handler, current_mailer)
      @current_mailer = current_mailer
      super(next_handler)
    end

    def process(entity)
      # @current_mailer.new_enquiry_confirmation(entity).deliver
      puts "email sended!!!"
      entity
    end

  end
end

