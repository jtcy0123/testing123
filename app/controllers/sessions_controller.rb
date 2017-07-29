class SessionsController < Clearance::SessionsController

  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        if current_user.status == 1
          redirect_to stories_path
        else
          if DateTime.now.strftime("%B %d, %Y") > current_user.updated_at.localtime.strftime("%B %d, %Y")
            user = current_user
            user.point += 1
            user.save(validate: false)
          end
          # flash[:msg] = "Login Successfully!"
          redirect_back fallback_location: root_path
        end
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
