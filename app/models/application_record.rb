class ApplicationRecord < ActiveRecord::Base
  include Disable

  self.abstract_class = true
end
