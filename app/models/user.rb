class User < ApplicationRecord
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_one :profile, dependent: :destroy
  has_many :songs, dependent: :destroy
  has_many :likes
  has_many :liked_songs, :through => :likes, :source => :song

  def to_param
    username
  end

  # Likes a song.
  def like(song)
    likes.create(song_id: song.id)
  end

  # Unlikes a song.
  def unlike(song)
    likes.find_by(song_id: song.id).destroy
  end

  # Returns true if the current user is liking a song.
  def liking?(song)
    likes.include?(song)
  end

  private

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

end
