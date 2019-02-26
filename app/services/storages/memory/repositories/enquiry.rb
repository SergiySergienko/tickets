module Storages
  module Memory
    module Repositories
      class Enquiry < Base
        include RefIdGenerator

        class << self

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
end