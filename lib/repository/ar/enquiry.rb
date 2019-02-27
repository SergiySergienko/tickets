#
# Enquiry Repository class
# includes enquiry-specific calls to AR ORM
#
module Repository
  module AR
    class Enquiry
      include Repository::RepositoryInterface
      
      class << self
        delegate :generate_id, to: :RefIdService
        
        def find_by(*args)
          AR::Models::Enquiry.find_by(*args)
        end

        def create(entity_attrs)
          entity_attrs.merge!({ ref_id: generate_id })
          enquiry = prepare_new(entity_attrs)
          enquiry.save if enquiry.valid?
          enquiry
        end

        def prepare_new(*args)
          AR::Models::Enquiry.new(*args)
        end

        def all
          AR::Models::Enquiry.all
        end

      end
      
    end
  end
end
