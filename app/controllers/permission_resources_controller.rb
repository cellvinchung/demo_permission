class PermissionResourcesController < AuthedController
  helper_method :permission_resource
  def index
    @permission_resources = PermissionResource.all
  end

  def show

  end

  def new
    @permission_resource = PermissionResource.new
  end

  def create
    @permission_resource = PermissionResource.new(permit_attribute)
    @permission_resource.save

    redirect_to url_for(action: :index)
  end

  def edit

  end

  def update
    permission_resource.update(permit_attribute)
    redirect_to url_for(action: :index)
  end

  def destroy
    permission_resource.destroy
    redirect_to url_for(action: :index)
  end

  private

  def permission_resource
    @permission_resource ||= PermissionResource.find(params[:id])
  end

  def permit_attribute
    params.require(:permission_resource).permit(
      :name,
      :default_priority
    )
  end
end
