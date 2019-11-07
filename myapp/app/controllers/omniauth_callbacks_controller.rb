class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    basic_action
  end

  private

  def basic_action
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: request.env["omniauth.auth"].provider) if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end
