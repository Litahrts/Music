class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :active_followings, class_name:  "Follow", foreign_key: "follower_id", dependent:   :destroy
  has_many :following, through: :active_followings, source: :followed

  has_many :passive_followings, class_name:  "Follow", foreign_key: "followed_id", dependent:   :destroy
  has_many :followers, through: :passive_followings, source: :follower

  # Follows a user.
  def follow(other_user)
    active_followings.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_followings.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

end
