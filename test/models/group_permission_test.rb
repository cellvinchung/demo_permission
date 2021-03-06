# == Schema Information
#
# Table name: group_permissions
#
#  id                     :bigint           not null, primary key
#  priority               :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  permission_resource_id :bigint           not null
#  user_group_id          :bigint           not null
#
# Indexes
#
#  index_group_permissions_on_permission_resource_id  (permission_resource_id)
#  index_group_permissions_on_priority                (priority)
#  index_group_permissions_on_user_group_id           (user_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (permission_resource_id => permission_resources.id)
#  fk_rails_...  (user_group_id => user_groups.id)
#
require "test_helper"

class GroupPermissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
