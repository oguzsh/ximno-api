# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  user_id        :bigint           not null
#  body           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  comments_count :integer
#
class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  scope :by_recently_created, -> { order(created_at: :desc) }
end
