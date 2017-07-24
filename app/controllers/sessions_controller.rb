class SessionsController < Clearance::SessionsController

  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        # flash[:msg] = "Login Successfully!"
        redirect_back fallback_location: root_path
      else
        @error = status.failure_message
        render template: "sessions/new"
      end
    end
  end

  def destroy
    sign_out
    redirect_back fallback_location: root_path
  end

end
