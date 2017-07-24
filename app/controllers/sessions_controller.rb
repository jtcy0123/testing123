class SessionsController < Clearance::SessionsController

  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        # flash[:msg] = "Login Successfully!"
        redirect_to "/"
      else
        @error = status.failure_message
        render template: "sessions/new"
      end
    end
  end
end
