# == Schema Information
#
# Table name: user_groups
#
#  id          :bigint           not null, primary key
#  name        :string
#  super_admin :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_user_groups_on_super_admin  (super_admin)
#
require "test_helper"

class UserGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
