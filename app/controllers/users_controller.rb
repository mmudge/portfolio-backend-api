class UsersController < ApplicationController
  def current
    user = current_user
    if user
      render json: user
    else
      render json: { errors: "no logged in user" }, status: :unprocessable_entity
    end
  end
end
