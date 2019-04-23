class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login_user!(@user)
            redirect_to user_path(@user)
        else
            render json: user.errors.full_messages
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
