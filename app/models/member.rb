class Member < ApplicationRecord
  has_one_attached :avatar
    
    # has_attached_file :avatar, styles: { medium: "50x50>", thumb: "25x25>" }
    # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    
    # kaminari
  paginates_per 5
end
