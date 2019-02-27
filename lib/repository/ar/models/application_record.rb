module Repository::AR::Models
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
