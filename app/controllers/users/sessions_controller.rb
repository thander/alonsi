module Users
  class SessionsController < Devise::SessionsController
    before_filter :authenticate_user!, except: [:create, :destroy, :show]
    skip_before_filter :verify_authenticity_token


    def create
      if current_user.blank?
        render nothing: :true, status: 401
      else
        @user = current_user
      end

    end

  end
end
