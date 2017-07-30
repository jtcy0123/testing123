class UsersController < Clearance::UsersController
  def new
    @user = User.new
    render template: "users/new"
  end

  def create
    @user = User.new(user_params)
    @user.point = 0
    if @user.save
      sign_in @user
      redirect_back fallback_location: root_path
    else
      flash[:error] = @user.errors.full_messages
      redirect_back fallback_location: root_path
    end
  end

  def show
    if !signed_in?
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :photo)
  end
end
