class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
        if user.nil?
            flash.now[:errors] = ["Wrong combination of email and password. Please try again."]
            render :new
        else
            login_user!(user)
            redirect_to bands_path
        end
    end

    def destroy
        logout_user!
        render :new
    end
end
