class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
def instagram
    user = User.find_for_oauth(request.env['omniauth.auth'])

    if user.persisted?
      # user.influencer.create_for(user)
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Instagram') if is_navigational_format?
    else
      session['devise.instagram_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end

