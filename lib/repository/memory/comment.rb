module Repository
  module Memory
    class Comment < Base

      class << self

        def all_by_enquiry_id(enquiry_id)
          filter_by(enquiry_id: enquiry_id)
        end

        protected

        def current_model
          ::Comment
        end

      end
    end
  end
end
