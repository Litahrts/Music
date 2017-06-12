class Profile < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/profile.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_attached_file :cover, default_url: "/images/cover.jpg"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/


  belongs_to :user
end
