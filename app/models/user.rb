# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  has_person_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :training_programs, dependent: :destroy

  has_many :received_follows, foreign_key: :followed_user_id, class_name: 'Follow', dependent: :destroy
  has_many :followers, through: :received_follows, source: :follower

  has_many :given_follows, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy
  has_many :followings, through: :given_follows, source: :followed_user

  def follow(user)
    given_follows.create(followed_user_id: user.id)
  end

  def unfollow(user)
    given_follows.find_by(followed_user_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
