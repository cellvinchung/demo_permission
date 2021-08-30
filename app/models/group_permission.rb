# 群組權限
class GroupPermission < ApplicationRecord
  PRIORITY_OPTIONS = {
    disable: 0,
    readable: 1,
    writable: 2
  }
  belongs_to :user_group
  belongs_to :permission_resource
  scope :enable, -> { where('group_permissions.priority > 0') }
  enum priority: PRIORITY_OPTIONS

  before_create :setup_priority

  private

  def setup_priority
    self.priority = permission_resource.default_priority if priority.nil?
  end
end

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
