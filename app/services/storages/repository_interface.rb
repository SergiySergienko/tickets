module Storages
  module RepositoryInterface

    def self.included base
      base.extend ClassMethods
    end

    module ClassMethods
      def find_by(*args)
        raise "'find_by' method should be implemented"
      end

      def create(entity_attrs)
        raise "'create' method should be implemented"
      end

      def all
        raise "'all' method should be implemented"
      end

      def prepare_new
        raise "'prepare_new' method should be implemented"
      end
    end

  end
end
