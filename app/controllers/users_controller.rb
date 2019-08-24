class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        # user = User.find_by_sql("SELECT * FROM users where username = '#{params[:id].gsub("'", "`")}'").first
        render json: user
    end

    def current
        user = current_user
        if user
            render json: user
        else
            render json: { errors: "no logged in user" }, status: :unprocessable_entity
        end
    end
end
