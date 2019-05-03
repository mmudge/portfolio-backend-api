class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save
    render_resource(resource)
  end

  private

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username)
    end

    def account_update_params
      params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :username, :profile_pic)
    end
end
