class Archive < ApplicationRecord
    has_one_attached :file

     # kaminari
  paginates_per 5  
end
