# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  user_id        :bigint           not null
#  body           :string
#  comments_count :integer
#  archived       :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
