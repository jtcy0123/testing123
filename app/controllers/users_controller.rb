class UsersController < Clearance::UsersController
  def new
    @user = User.new
    render template: "users/new"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to "/"
    else
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :photo)
  end
end
