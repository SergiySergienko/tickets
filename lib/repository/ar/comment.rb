#
# ActiveRecord Comment Repository class
# includes comment-specific calls to AR ORM
#
module Repository
  module AR
    class Comment
      include Repository::RepositoryInterface
      
      class << self

        def all_by_enquiry_id(enquiry_id)
          AR::Models::Comment.where(enquiry_id: enquiry_id)
        end
        
        def prepare_new(*args)
          AR::Models::Comment.new(*args)
        end

        def create(entity_attrs)
          AR::Models::Comment.create(entity_attrs)
        end

      end

    end
  end
end
