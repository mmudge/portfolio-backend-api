class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        # user = User.find(params[:id])
        user = User.find_by_sql("SELECT * FROM users where username = '#{params[:id].gsub("'", "`")}'").first
        render json: user
    end

    def current
        if user = current_user
            render json: user
        else
            raise 'user not logged in'
            render json: user.errors, status: :unprocessable_entity
        end
    end
end
