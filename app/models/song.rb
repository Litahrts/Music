class Song < ApplicationRecord
  has_attached_file :picture, default_url: "/images/music.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  has_attached_file :audio
  validates_attachment_size :audio, :less_than => 10.megabytes

  belongs_to :user
end
