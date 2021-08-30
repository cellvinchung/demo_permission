# 權限資源
class PermissionResource < ApplicationRecord
  has_many :group_permissions, dependent: :destroy
  enum default_priority: GroupPermission::PRIORITY_OPTIONS

  after_create :setup_group_sermissions

  private

  def setup_group_sermissions
    UserGroup.all.each do |user_group|
      user_group.permission_resources += [self]
    end
  end
end

# == Schema Information
#
# Table name: permission_resources
#
#  id               :bigint           not null, primary key
#  default_priority :integer          default("disable")
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_permission_resources_on_default_priority  (default_priority)
#
