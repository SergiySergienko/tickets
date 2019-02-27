#
# ActiveRecord Comment Repository class
# includes comment-specific calls to AR ORM
#
module Repository
  module AR
    class Comment < Base

      class << self

        def all_by_enquiry_id(enquiry_id)
          current_model.where(enquiry_id: enquiry_id)
        end
        
        protected
        
        def current_model
          AR::Models::Comment
        end
  
      end

    end
  end
end
