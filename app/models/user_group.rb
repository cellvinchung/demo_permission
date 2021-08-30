class UserGroup < ApplicationRecord
  has_many :users
  has_many :group_permissions, dependent: :destroy
  accepts_nested_attributes_for :group_permissions
  has_many :permission_resources, through: :group_permissions
  has_many :enabled_permissions, -> { enable }, class_name: 'GroupPermission'
  has_many :enabled_resources, through: :enabled_permissions
end

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
