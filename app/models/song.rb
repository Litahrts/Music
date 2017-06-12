class Song < ApplicationRecord
  validates :name, :presence => true
  has_attached_file :picture, default_url: "/images/music.png"
  has_attached_file :audio
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :audio, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ], message: "has to be in MP3 format"
  validates_attachment_size :audio, :less_than => 10.megabytes

  belongs_to :user
  has_many :likes
  has_many :liking_users, :through => :likes, :source => :user

  # Returns true if the current user is liking a song.
  def liked_by?(user)
    liking_users.include?(user)
  end

end
