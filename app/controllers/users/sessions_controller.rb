# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    def destroy
      super
    end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end

    def sign_in_with_token
      user = User.find_by(login_token: params[:login_token])

      if user.present?
        user.update(login_token: nil, login_token_valid_until: 1.year.ago)
        sign_in(user)
        redirect_to root_path
      else
        flash[:alert] = "There was an error while login. Please enter your email again."
        redirect_to new_user_session_path
      end
    end

    def redirect_from_magic_link
      @login_token = params[:login_token] if params[:login_token].present?
    end
  end
end
