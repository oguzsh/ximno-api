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
#  archived       :boolean          default(FALSE)
#
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
