class UserGroupsController < AuthedController
  helper_method :user_group
  def index
    @user_groups = UserGroup.all
  end

  def show
    @users = user_group.users
  end

  def new
    @user_group = UserGroup.new

    PermissionResource.all.each do |permission_resource|
      @user_group.group_permissions.new(permission_resource: permission_resource, priority: permission_resource.default_priority)
    end
  end

  def create
    @user_group = UserGroup.new(permit_attribute)
    @user_group.save

    redirect_to url_for(action: :index)
  end

  def edit

  end

  def update
    user_group.update(permit_attribute)
    redirect_to url_for(action: :index)
  end

  def destroy
    user_group.destroy
    redirect_to url_for(action: :index)
  end

  private

  def user_group
    @user_group ||= UserGroup.includes(:permission_resources).find(params[:id])
  end

  def permit_attribute
    params.require(:user_group).permit(
      :name,
      :super_admin,
      group_permissions_attributes: %i[id priority permission_resource_id]
    )
  end
end
