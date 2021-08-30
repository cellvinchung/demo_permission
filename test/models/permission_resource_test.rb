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
require "test_helper"

class PermissionResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
