class Article < ActiveRecord::Base
  self.primary_key = :file_name
end
