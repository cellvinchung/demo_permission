class UsersController < AuthedController
  helper_method :user
  def index
    @users = User.all.includes(:user_group)
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(permit_attribute)
    @user.save

    redirect_to url_for(action: :index)
  end

  def edit

  end

  def update
    user.update(permit_attribute)
    redirect_to url_for(action: :index)
  end

  def destroy
    user.destroy
    redirect_to url_for(action: :index)
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def permit_attribute
    params.require(:user).permit(
      :email,
      :user_group_id,
      :password,
      :password_confirmation
    )
  end
end
