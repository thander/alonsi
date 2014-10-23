class Users::OmniauthCallbacksController < ApplicationController
  def vkontakte
    user = User.find_for_vkontakte_oauth request.env["omniauth.auth"]
    if user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Vkontakte"
      sign_in user, :event => :authentication
      respond_to do |format|
        format.html do
          render 'vkontakte'
        end
        format.json do
          @user = current_user
        end
      end
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end


end
