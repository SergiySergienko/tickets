module Storages
  module ActiveRecord
    module Repositories
      class Enquiry
        include Storages::RepositoryInterface
        include RefIdGenerator
        
        class << self
          def find_by(*args)
            Storages::ActiveRecord::Models::Enquiry.find_by(*args)
          end

          def create(entity_attrs)
            entity_attrs.merge!({ ref_id: generate_id })
            enquiry = prepare_new(entity_attrs)
            enquiry.save if enquiry.valid?
            enquiry
          end

          def prepare_new(*args)
            Storages::ActiveRecord::Models::Enquiry.new(*args)
          end

          def all
            Storages::ActiveRecord::Models::Enquiry.all
          end

        end

      end
    end
  end
end
