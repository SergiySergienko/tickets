#
# User Repository class
# includes user-specific calss to AR ORM
#
module Repository
  module AR
    class User
      include Repository::RepositoryInterface
      
      class << self
        def find_by(*args)
          Repository::AR::Models::User.find_by(*args)
        end

        def create(entity_attrs)
          Repository::AR::Models::User.create(entity_attrs)
        end

        def all
          Repository::AR::Models::User.all
        end

      end

    end
  end
end