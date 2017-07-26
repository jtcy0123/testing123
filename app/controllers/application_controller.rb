class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  before_action :point

  def point
    if current_user
      if DateTime.now.strftime("%B %d, %Y") > current_user.updated_at.strftime("%B %d, %Y")
        current_user.update(updated_at:DateTime.now)
        x = current_user.point
        x += 1
        current_user.update_attribute('point',x)

      end
    end
  end
end
