module Repository
  module Memory
    class Enquiry < Base

      class << self

        delegate :generate_id, to: :RefIdService

        def create(entity_attrs)
          entity_attrs.merge!({ ref_id: generate_id })
          super
        end
        
        protected

        def current_model
          ::Enquiry
        end

      end
    end
  end
end